class Meeting < ApplicationRecord
  belongs_to :location

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :url_slug, presence: true, uniqueness: true

  enum :day, %i[monday tuesday wednesday thursday friday saturday sunday]
  enum :language, %i[english spanish french italian japanese chinese russian]
  enum :status, %i[approved requires_review requires_changes rejected]
end
