require_relative '../../lib/classes/slug_validator'

class Location < ApplicationRecord
  self.table_name = 'locations'
  self.inheritance_column = 'location_type'

  has_many :meetings

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 255 }
  validates :slug, presence: true, uniqueness: true
  validates :location_type, presence: true,
                            inclusion: {
                              in: %w[VirtualLocation PhysicalLocation],
                              message: '%<value>s is not permitted.'
                            }
  validates :status, presence: true, inclusion: {
    in: %w[approved requires_review requires_changes rejected],
    message: '%<value>s is not permitted.'
  }
  validates_with SlugValidator

  enum :status, %i[approved requires_review requires_changes rejected]

  def initialize(*args)
    super(*args)
    @location_type = self.class.name
  end

  def self.tz_select_collection
    ActiveSupport::TimeZone.all.map(&:tzinfo).map(&:canonical_zone).uniq.map do |tz|
      { name: tz.name, abbr: tz.abbr, display: ActiveSupport::TimeZone[tz.name].to_s }
    end
  end
end
