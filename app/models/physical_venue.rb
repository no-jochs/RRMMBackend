class PhysicalVenue < Venue
  validates :time_zone, presence: true
  validates :country, presence: true
  validate :country_is_valid_aplha2_code
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

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
