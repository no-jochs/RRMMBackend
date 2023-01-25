class Meeting < ApplicationRecord
  belongs_to :location

  validates :name, presence: true
  validates :location, presence: true

  enum :day, %i[monday tuesday wednesday thursday friday saturday sunday]
  enum :language, %i[english spanish french italian japanese chinese russian]
end
