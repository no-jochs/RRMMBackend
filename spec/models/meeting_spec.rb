require 'rails_helper'

RSpec.describe Meeting, type: :model do
  [{ type: :in_person_meeting, name: 'In Person Meeting' },
   { type: :hybrid_meeting, name: 'Hybrid Meeting' }].each do |h|
    describe h[:name] do
      subject(:meeting) { build(h[:type]) }
      let!(:existing_meeting) { create(h[:type]) }

      it 'requires a location' do
        meeting.location = nil
        expect(meeting).to_not be_valid
      end

      it 'saves associated location if location is not persisted' do
        expect(meeting.location).to be_present
        meeting.save
        expect(meeting.location).to be_persisted
      end

      describe '#time_zone' do
        it 'delegates to associated location' do
          meeting.time_zone = 'America/Los_Angeles'
          meeting.location.time_zone = 'Pacific/Honolulu'
          expect(meeting.time_zone).to eq('Pacific/Honolulu')
        end
      end
    end
    describe 'format=' do
      it "only accepts arguments #{Meeting.formats.keys}" do
        expect { meeting.format = 'foo' }.to raise_error(ArgumentError)
      end
    end

    describe 'Online Meetings' do
      subject(:online_meeting) { build(:online_meeting) }

      it 'requires a location' do
        meeting.location = nil
        expect(meeting).to_not be_valid
      end

      it 'saves associated location if location is not persisted' do
        expect(meeting.location).to be_present
        meeting.save
        expect(meeting.location).to be_persisted
      end

      describe '#time_zone' do
        it 'delegates to associated location' do
          meeting.time_zone = 'America/Los_Angeles'
          meeting.location.time_zone = 'Pacific/Honolulu'
          expect(meeting.time_zone).to eq('Pacific/Honolulu')
        end
      end
    end

    context 'when venue is online' do
      subject(:meeting) { build(:online_meeting) }

      it 'cannot have an associated location' do
        meeting.location = build(:location)
        expect(meeting).to_not be_valid
      end

      describe '#time_zone' do
        it 'must be present' do
          meeting.time_zone = nil
          expect(meeting).to_not be_valid
        end

        it 'must be a valid time zone' do
          meeting.time_zone = 'Universal/Alpha_Centuri'
          expect(meeting).to_not be_valid
        end
      end
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
        meeting.slug = existing_meeting.slug
        expect(meeting).to_not be_valid
      end
    end

    describe 'start_date' do
      it 'must be present' do
        meeting.start_date = nil
        expect(meeting).to_not be_valid
      end
    end

    describe 'next_meeting' do
      it 'is in the future' do
        expect(meeting.start_date).to be_past
        expect(meeting.next_meeting).to be_future
      end

      it 'is the same weekday as start_date' do
        expect(meeting.next_meeting.wday).to eq(meeting.start_date.wday)
      end

      it 'is always less than 7 days from now' do
        meeting.start_date = Time.current
        expect(meeting.next_meeting).to be_before(Time.current.in(7.days))
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

  describe 'Online Meeting' do
  end
end
