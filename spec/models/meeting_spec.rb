require 'rails_helper'

RSpec.describe Meeting, type: :model do
  it 'requires a location' do
    meeting = FactoryBot.build(:meeting)
    expect(meeting).to_not be_valid
  end

  it 'requires a name' do
    expect { Meeting.create! }.to raise_error
  end
end
