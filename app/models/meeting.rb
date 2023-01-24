class Meeting < ApplicationRecord
  has_one :location

  validates :name, presence: true
  validates :location, presence: true

  enum :language, %i[english spanish french italian japanese russian]
end
