class TzFormatValidator < ActiveModel::Validator
  def validate(record)
    return true if Location.tz_select_collection.pluck(:name).include?(record.time_zone)

    record.errors.add(:time_zone, 'cannot be blank') if record.time_zone.blank? && return
    record.errors.add(:time_zone, "#{record.time_zone} is not a valid tz-database format")
  end
end
