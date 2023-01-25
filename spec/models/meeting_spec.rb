require 'rails_helper'

RSpec.describe Meeting, type: :model do
  let(:meeting) { build(:meeting) }

  it 'requires a location' do
    meeting.location = nil
    expect(meeting).to_not be_valid
  end

  it 'requires a name' do
    meeting.name = nil
    expect(meeting).to_not be_valid
  end

  it 'is invalid with a trivial name' do
    meeting.name = 'a'
    expect(meeting).to_not be_valid
  end

  describe 'url_slug' do
    it 'is invalid unless url-safe' do
      meeting.url_slug = 'something("unsafe\\'
      expect(meeting).to_not be_valid
    end

    it 'may contain hyphens' do
      meeting.url_slug = 'something-with-hyphens'
      expect(meeting).to be_valid
    end

    it 'may contain underscores' do
      meeting.url_slug = 'something_with_underscores'
      expect(meeting).to be_valid
    end

    it 'may contain numbers' do
      meeting.url_slug = 'something-with-numbers-321'
      expect(meeting).to be_valid
    end

    it 'must be unique' do
      existing_meeting = create(:meeting)
      meeting.url_slug = existing_meeting.url_slug
      expect(meeting).to_not be_valid
    end
  end

  describe 'start_date' do
    it 'is invalid if in the past' do
      meeting.start_date = 1.day.ago
      expect(meeting).to_not be_valid
    end

    it 'is valid if it is today' do
      meeting.start_date = Time.zone.today
      expect(meeting).to be_valid
    end

    it 'is valid if it is in the future' do
      meeting.start_date = Time.zone.today + 1.day
      expect(meeting).to be_valid
    end
  end

  describe 'start_time_hour' do
    it 'is only valid if in range of 0..23' do
      meeting.start_time_hour = 0
      expect(meeting).to be_valid
      meeting.start_time_hour = -1
      expect(meeting).to_not be_valid
      meeting.start_time_hour = 24
      expect(meeting).to_not be_valid
    end
  end

  describe 'start_time_minute' do
    it 'is only valid if in range of 0..59' do
      meeting.start_time_minute = 0
      expect(meeting).to be_valid
      meeting.start_time_minute = -1
      expect(meeting).to_not be_valid
      meeting.start_time_minute = 60
      expect(meeting).to_not be_valid
    end
  end

  describe 'duration' do
    it 'must be positive' do
      meeting.duration = -2
      expect(meeting).to_not be_valid
    end
  end
end
