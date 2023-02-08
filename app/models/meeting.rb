require_relative '../../lib/classes/slug_validator'
class Meeting < ApplicationRecord
  belongs_to :location

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :start_date, presence: true
  validates :slug, presence: true, uniqueness: true
  validates_with SlugValidator

  enum :language, %i[english spanish french italian japanese chinese russian]
  enum :status, %i[approved requires_review requires_changes rejected]
end
