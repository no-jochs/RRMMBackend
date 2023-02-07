require_relative '../../lib/classes/slug_validator'

class Location < ApplicationRecord
  has_many :meetings

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validate :country_is_valid_aplha2_code
  validates :timezone_identifier, presence: true
  validate :timezone_identifier_is_tz_database_format
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :slug, presence: true, uniqueness: true
  validates_with SlugValidator
  validates :venue_type, presence: true

  enum :venue_type, %i[in_person online hybrid]
  enum :status, %i[approved requires_review requires_changes rejected]

  def iso3166_country
    ISO3166::Country[country]
  end

  def country_common_name
    ISO3166::Country[country]&.common_name
  end

  def timezone=(tz_string)
    tz = ActiveSupport::TimeZone[tz_string]
    self.timezone_identifier = tz&.name
  end

  def timezone
    ActiveSupport::TimeZone[timezone_identifier]
  end

  def timezone_name
    timezone&.tzinfo&.name
  end

  def utc_offset
    timezone&.utc_offset
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

  def timezone_identifier_is_tz_database_format
    if timezone_identifier.blank?
      errors.add(:timezone_identifier, 'Timezone identifier cannot be blank.') and return false
    end
    return true unless ActiveSupport::TimeZone[timezone_identifier].nil?

    errors.add(:timezone_identifier, "#{timezone_identifier} is not a valid timezone identifier.")
  end
end
