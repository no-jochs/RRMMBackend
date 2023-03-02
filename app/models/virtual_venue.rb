class VirtualVenue < Venue
  NAME_VALUE = 'Online'.freeze
  SLUG_VALUE = 'online'.freeze

  class << self
    def instance
      @@instance ||= find_or_create_by!(name: NAME_VALUE, slug: SLUG_VALUE)
      @@instance
    end
  end
end
