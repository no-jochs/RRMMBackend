require_relative '../../lib/classes/slug_validator'
class Meeting < ApplicationRecord
  belongs_to :location

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validate :start_date_cannot_be_in_the_past
  validates :start_time_hour, presence: true,
                              numericality: { greater_than_or_equal_to: 0, less_than: 24, only_integer: true }
  validates :start_time_minute, presence: true,
                                numericality: { greater_than_or_equal_to: 0, less_than: 60, only_integer: true }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :slug, presence: true, uniqueness: true
  validates_with SlugValidator

  enum :day, Date::DAYNAMES.map(&:downcase).map(&:to_sym)
  enum :language, %i[english spanish french italian japanese chinese russian]
  enum :status, %i[approved requires_review requires_changes rejected]

  private

  def start_date_cannot_be_in_the_past
    return unless start_date.present? && start_date < Date.current

    errors.add(:start_date, 'Start date cannot be in the past.')
  end
end
