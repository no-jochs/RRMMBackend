require 'rails_helper'

RSpec.describe Location, type: :model do
  subject(:location) { build(:location) }

  describe 'name' do
    it 'cannot be empty' do
      location.name = nil
      expect(location).to_not be_valid
    end

    it 'cannot be trivial' do
      location.name = 'a'
      expect(location).to_not be_valid
    end

    it 'cannot be longer than 255 characters' do
      location.name = 'a' * 256
      expect(location).to_not be_valid
    end
  end

  describe 'latitude' do
    it 'is invalid if not in the range [-90, 90]' do
      location.latitude = 90.123456
      expect(location).not_to be_valid
      location.latitude = -90.123456
      expect(location).not_to be_valid
      location.latitude = 55.123456
      expect(location).to be_valid
      location.latitude = -55.123456
      expect(location).to be_valid
    end
  end

  describe 'longitude' do
    it 'is invalid if not in the range [-180, 180]' do
      location.longitude = 180.123456
      expect(location).not_to be_valid
      location.longitude = -180.123456
      expect(location).not_to be_valid
      location.longitude = 130.123456
      expect(location).to be_valid
      location.longitude = -155.123456
      expect(location).to be_valid
    end
  end

  describe 'country' do
    it 'cannot be empty' do
      location.country = nil
      expect(location).to_not be_valid
    end

    it 'is invalid when not an ISO 3166 Alpha 2 Code' do
      location.country = 'XXX'
      expect(location).not_to be_valid
    end

    it 'is valid with upper or lowercase ISO 3166 Alpha 2 Code' do
      location.country = 'us'
      expect(location.iso3166_country.alpha2).to eq('US')
    end

    it 'is an instance of ISO3166::Country' do
      expect(location.iso3166_country).to be_instance_of(ISO3166::Country)
    end
  end

  describe 'venue_type=' do
    it 'cannot be empty' do
      location.venue_type = nil
      expect(location).to_not be_valid
    end

    it "raises error if not one of #{Location.venue_types.keys.join(', ')}" do
      expect { location.venue_type = 'foo' }.to raise_error(ArgumentError)
    end
  end

  describe 'time_zone' do
    it 'cannot be empty' do
      location.time_zone = nil
      expect(location).to_not be_valid
    end

    it 'is valid when it conforms to TZ database format' do
      location.time_zone = 'America/New_York'
      expect(location).to be_valid
    end

    it 'is invalid when it does not conform to TZ database format' do
      location.time_zone = 'Cal-Zone'
      expect(location).to_not be_valid
    end
  end

  describe 'as_time_zone' do
    it 'is nil if time_zone is nil' do
      location.time_zone = nil
      expect(location.as_time_zone).to be_nil
    end

    it 'returns an instance of ActiveSupport::TimeZone if time_zone is set' do
      location.time_zone = 'America/New_York'
      expect(location.as_time_zone).to be_instance_of(ActiveSupport::TimeZone)
    end
  end
end
