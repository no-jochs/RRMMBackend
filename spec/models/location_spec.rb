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

  describe 'timezone=' do
    it 'updates the value of timezone_identifier' do
      new_timezone = nil
      while new_timezone.nil?
        z = ActiveSupport::TimeZone.all.sample.tzinfo.name
        new_timezone = location.timezone == z ? nil : z
      end
      location.timezone = new_timezone
      expect(location.timezone_identifier).to eq(new_timezone)
    end
  end

  describe 'timezone' do
    it 'returns an ActiveSupport::TimeZone object if set' do
      location.timezone = 'Central Time (US & Canada)'
      expect(location.timezone).to be_instance_of(ActiveSupport::TimeZone)
    end

    it 'is valid when it conforms to TZ database format' do
      location.timezone = 'Eastern Time (US & Canada)'
      expect(location).to be_valid
    end

    it 'is invalid when it does not conform to TZ database format' do
      location.timezone = 'Cal-Zone'
      expect(location).to_not be_valid
    end
  end
end
