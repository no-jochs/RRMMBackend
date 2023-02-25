require 'rails_helper'

RSpec.describe PhysicalLocation, type: :model do
  let(:location) { build(:physical_location) }

  include_examples 'location examples'
end
