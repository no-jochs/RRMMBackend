require_relative '../../lib/classes/slug_validator'

class Venue < ApplicationRecord
  has_many :meetings

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :slug, presence: true, uniqueness: true
  validates_with SlugValidator

  enum :status, %i[approved requires_review requires_changes rejected]

  def self.tz_select_collection
    ActiveSupport::TimeZone.all.map(&:tzinfo).map(&:canonical_zone).uniq.map do |tz|
      { name: tz.name, abbr: tz.abbr, display: ActiveSupport::TimeZone[tz.name].to_s }
    end
  end

  def iso3166_country
    ISO3166::Country[country]
  end

  def country_common_name
    ISO3166::Country[country]&.common_name
  end

  def utc_offset
    as_time_zone&.utc_offset
  end

  def as_time_zone
    return nil if time_zone.nil?

    ActiveSupport::TimeZone[time_zone]
  end

  def street_address
    return nil if street_address_1.blank?

    street_address_1 + (street_address_2.blank? ? '' : "\n") + street_address_2
  end

  def formatted_address
    if iso3166_country && iso3166_country.address_format.present?
      @template ||= Liquid::Template.parse(iso3166_country.address_format.sub("{{recipient}}\n", ''))
      @template.render({
                         'street' => street_address,
                         'city' => city,
                         'region_short' => iso3166_country.subdivisions[state_providence]&.code || '',
                         'postalcode' => postal_code,
                         'country' => iso3166_country.common_name
                       })
    else
      result = ''
      result += "#{street_address_1}\n"
      result += street_address_2.blank? ? '' : "#{street_address_2}\n"
      result += "#{city}, #{state_providence} #{postal_code}\n"
      result + country_common_name
    end
  end
end
