require_relative '../../lib/classes/slug_validator'

class Location < ApplicationRecord
  has_many :meetings

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validate :country_is_valid_aplha2_code
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :slug, presence: true, uniqueness: true
  validates_with SlugValidator
  validates :venue_type, presence: true

  enum :venue_type, %i[in_person online hybrid]
  enum :status, %i[approved requires_review requires_changes rejected]

  def country_common_name
    ISO3166::Country[country]&.common_name
  end

  def timezone=(tz_string)
    if tz_string.nil?
      self.timezone_identifier = nil
    else
      tz = ActiveSupport::TimeZone[tz_string]
      raise ArgumentError, "#{tz_string} is not a valid timezone." if tz.nil?

      self.timezone_identifier = tz.name
      tz.name
    end
  end

  def timezone
    timezone_identifier
  end

  def timezone_name
    ActiveSupport::TimeZone[timezone_identifier]&.tzinfo&.name
  end

  def utc_offset
    ActiveSupport::TimeZone[timezone_identifier]&.utc_offset
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
end
