require_relative '../../lib/classes/slug_validator'

class Location < ApplicationRecord
  has_many :meetings

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validate :country_is_valid_aplha2_code
  validates :time_zone, presence: true
  validate :time_zone_is_tz_database_format
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :slug, presence: true, uniqueness: true
  validates_with SlugValidator
  validates :venue_type, presence: true

  enum :venue_type, %i[in_person online hybrid]
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

  private

  def country_is_valid_aplha2_code
    country_object = ISO3166::Country[country]
    if country_object.nil?
      errors.add(:country, 'Country cannot be blank.')
    elsif country != country_object.alpha2
      errors.add(:country, "#{country} is not a valid Alpha 2 country code.")
    end
    true
  end

  def time_zone_is_tz_database_format
    return true if as_time_zone.present?

    errors.add(:time_zone, 'Time zone is not a valid database format.')
  end
end
