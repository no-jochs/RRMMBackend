require 'open-uri'

module API
  module GoogleMaps
    module Query
      module Places
        RESPONSE_PARAM_KEYS = %w[formatted_address name geometry photos place_id types url utc_offset
                                 wheelchair_accessible_entrance].freeze

        class Place
          attr_reader(*Places::RESPONSE_PARAM_KEYS.map(&:intern))

          def initialize(attr_hash)
            @attrs = ActiveSupport::HashWithIndifferentAccess.new(attr_hash)
            Places::RESPONSE_PARAM_KEYS.each do |rpk|
              ivk = rpk.prepend('@').intern
              ivv = @attrs.delete(rpk.intern)
              instance_variable_set(ivk, ivv)
            end
          end

          def latitude
            geometry.dig(:location, :lat).to_f
          end

          def longitude
            geometry.dig(:location, :lng).to_f
          end
        end

        class FindPlaceFromTextSearch
          API_ENDPOINT = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json'.freeze
          PLACE_RESPONSE_FIELDS = %w[formatted_address formatted_phone_number name geometry photos place_id types url
                                     utc_offset wheelchair_accessible_entrance].freeze
          attr_reader(*PLACE_RESPONSE_FIELDS.map(&:intern))

          def initialize(params = ActiveSupport::HashWithIndifferentAccess.new)
            @p = ActionController::Parameters.new(params).require(:input)
            inpt = @p.fetch(:input)
            @params.merge!({ inputtype: phone_number?(inpt) ? 'phonenumber' : 'textquery',
                             key: ENV.fetch('GOOGLE_MAPS_API_KEY') })
            @p.merge!({ input: phone_number?(inpt) ? clean_phone_number(inpt) : clean_string(inpt) })
            @p.merge!({ fields: PLACE_RESPONSE_FIELDS.join(',') })
            @p.require(%i[input inputtype key])
            @p
          end

          def send!
            pa = ActiveSupport::HashWithIndifferentAccess.new(
              JSON.parse(URI.open(compose_api_uri).read).to_h
            ).fetch(:candidates)
            @results = pa.map { |attr_h| Place.new(attr_h) }
            @results
          end

          private

          def clean_string(string)
            string.strip.gsub(/\t+/, '').gsub(/\n+/, ', ').to_s
          end

          def clean_phone_number(phone_number)
            orig_phone_number = phone_number.to_s!.strip!.dup
            unless (md = orig_phone_number.match(/^(\+[^\d]*)?([\d\-\s()]{10,15})/))
              raise ArgumentError,
                    "Invalid phone number: #{orig_phone_number}"
            end

            cc_int = md[:cc].gsub!(/[^\d]/, '').to_i
            pn_int = md[:pn].gsub!(/[^\d]/, '').to_i

            pp ActiveSupport::NumberHelper.number_to_phone(
              pn_int, country_code: cc_int, delimiter: '', pattern: /(\d{7,15})/
            ).gsub(/[^+\d]/, '').to_s
          end

          def compose_api_uri
            uri = URI(API_ENDPOINT)
            uri.query = @params.to_query + "&key=#{ENV.fetch('GOOGLE_MAPS_API_KEY')}"
            uri.to_s
          end

          def phone_number?(input)
            input.to_s.match?(/^(\+[^\d]*)?([\d\-\s()]{10,15})/)
          end
        end

        def self.find_place_from_text(text, opt_params = ActiveSupport::HashWithIndifferentAccess.new)
          input = text.is_a?(String) ? text.strip : text.map(&:to_s).join(',')
          puts input
          opt_params.transform_values! do |v|
            v.is_a?(Array) ? v.map!(&:to_s).join(',') : v.to_s.strip!
          end.deep_symbolize_keys
          params = ActiveSupport::HashWithIndifferentAccess.new(opt_params).update({ input: }) # rubocop:disable
          raise ArgumentError, "'#{input}' is not a valid text input." if input.blank?

          search = FindPlaceFromTextSearch.new(params)
          search.send!
        end
      end
    end
  end
end
