require_relative '../../lib/classes/slug_validator'

class Location < ApplicationRecord
  has_many :meetings

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validate :country_is_valid_aplha2_code
  validates :latitude, presence: true, numericality: { greater_than: -90, less_than: 90 }
  validates :longitude, presence: true, numericality: { greater_than: -180, less_than: 180 }
  validates :url_slug, presence: true, uniqueness: true
  validates_with SlugValidator
  validates :venue_type, presence: true

  enum :venue_type, %i[in_person online hybrid]
  enum :status, %i[approved requires_review requires_changes rejected]

  def country=(country_string)
    country_object = ISO3166::Country[country_string]
    self.country_identifier = if country_object.nil?
                                nil
                              else
                                country_object.alpha2
                              end
  end

  def country
    ISO3166::Country[country_identifier]
  end

  def timezone=(tz_string)
    if tz_string.nil?
      self.timezone_identifier = nil
    else
      tz = ActiveSupport::TimeZone[tz_string]
      raise ArgumentError, "#{tz_string} is not a valid timezone." if tz.nil?

      timezone_identifier = tz.name
      tz
    end
  end

  def timezone
    return nil if timezone_identifier.nil?

    ActiveSupport::TimeZone[timezone_identifier]
  end

  private

  def country_is_valid_aplha2_code
    country_object = ISO3166::Country[country_identifier]
    return true unless country_object.nil?

    errors.add(:country, "#{country} is not a valid Alpha 2 country code.")
  end
end
