require_relative '../../lib/classes/slug_validator'
require_relative '../../lib/classes/tz_format_validator'

class Meeting < ApplicationRecord
  belongs_to :location

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :start_date, presence: true
  validates :slug, presence: true, uniqueness: true
  validates_with SlugValidator
  validates_with TzFormatValidator, if: :virtual?

  enum :format, %i[in_person virtual hybrid]
  enum :language, %i[english spanish french italian japanese chinese russian]
  enum :status, %i[approved requires_review requires_changes rejected]

  def next_meeting
    cutc = Time.current
    nm = Time.utc(cutc.year, cutc.month, cutc.day, start_date.hour, start_date.min)
    nm += 1.day until nm > cutc && nm.wday == start_date.wday
    nm
  end
end
