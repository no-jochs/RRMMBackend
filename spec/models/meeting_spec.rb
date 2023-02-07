require 'rails_helper'

RSpec.describe Meeting, type: :model do
  let(:meeting) { build(:meeting) }

  it 'requires a location' do
    meeting.location = nil
    expect(meeting).to_not be_valid
  end

  it 'saves associated location if location is not persisted' do
    meeting.location = build(:location)
    meeting.save
    expect(meeting.location).to be_persisted
  end

  describe 'name' do
    it 'requires a name' do
      meeting.name = nil
      expect(meeting).to_not be_valid
    end

    it 'cannot be an empty string' do
      meeting.name = ''
      expect(meeting).to_not be_valid
    end

    it 'is invalid with a trivial name' do
      meeting.name = 'a'
      expect(meeting).to_not be_valid
    end

    it 'cannot be longer than 255 characters' do
      meeting.name = 'a' * 256
      expect(meeting).to_not be_valid
    end
  end

  describe 'slug' do
    it 'is invalid unless url-safe' do
      meeting.slug = 'something("unsafe\\'
      expect(meeting).to_not be_valid
    end

    it 'may contain hyphens' do
      meeting.slug = 'something-with-hyphens'
      expect(meeting).to be_valid
    end

    it 'may contain underscores' do
      meeting.slug = 'something_with_underscores'
      expect(meeting).to be_valid
    end

    it 'may contain numbers' do
      meeting.slug = 'something-with-numbers-321'
      expect(meeting).to be_valid
    end

    it 'must be unique' do
      existing_meeting = create(:meeting)
      meeting.slug = existing_meeting.slug
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

  describe 'status=' do
    Meeting.statuses.each_key do |status|
      it "is valid with argument #{status}" do
        meeting.status = status
        expect(meeting).to be_valid
      end
    end

    it "raises error with argument other than #{Meeting.statuses.keys.join(', ')}." do
      expect { meeting.status = 'not-a-status' }.to raise_error(ArgumentError)
    end

    it 'accepts strings or symbols' do
      expect { meeting.status = 'approved' }.to_not raise_error
      expect { meeting.status = :approved }.to_not raise_error
    end
  end

  describe 'day=' do
    Meeting.days.each_key do |day|
      it "is vaild with argument #{day}" do
        meeting.day = day
        expect(meeting).to be_valid
      end
    end

    it "raises error with argument other than #{Meeting.days.keys.join(', ')}." do
      expect { meeting.day = 'not-a-day' }.to raise_error(ArgumentError)
    end

    it 'accepts strings or symbols' do
      expect { meeting.day = 'monday' }.to_not raise_error
      expect { meeting.day = :monday }.to_not raise_error
    end
  end

  describe 'language=' do
    Meeting.languages.each_key do |language|
      it "is vaild with argument #{language}" do
        meeting.language = language
        expect(meeting).to be_valid
      end
    end

    it "raises error with argument other than #{Meeting.languages.keys.join(', ')}." do
      expect { meeting.language = 'not-a-language' }.to raise_error(ArgumentError)
    end

    it 'accepts strings or symbols' do
      expect { meeting.language = 'english' }.to_not raise_error
      expect { meeting.language = :english }.to_not raise_error
    end
  end
end
