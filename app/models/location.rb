class Location < ApplicationRecord
  has_many :meetings

  validates :url_slug, presence: true, uniqueness: true

  enum :venue_type, %i[in_person online hybrid]
  enum :status, %i[approved requires_review requires_changes rejected]
end
