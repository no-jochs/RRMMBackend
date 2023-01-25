class Location < ApplicationRecord
  has_many :meetings

  enum :venue_type, %i[in_person online hybrid]
end
