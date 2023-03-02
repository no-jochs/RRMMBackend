require 'rails_helper'
require 'support/shared_examples_for_venues'

RSpec.describe PhysicalVenue, type: :model do
  include_examples 'core venue requirements'

  describe 'latitude' do
    it 'is invalid if not in the range [-90, 90]' do
      venue.latitude = 90.123456
      expect(venue).not_to be_valid
      venue.latitude = -90.123456
      expect(venue).not_to be_valid
      venue.latitude = 55.123456
      expect(venue).to be_valid
      venue.latitude = -55.123456
      expect(venue).to be_valid
    end
  end

  describe 'longitude' do
    it 'is invalid if not in the range [-180, 180]' do
      venue.longitude = 180.123456
      expect(venue).not_to be_valid
      venue.longitude = -180.123456
      expect(venue).not_to be_valid
      venue.longitude = 130.123456
      expect(venue).to be_valid
      venue.longitude = -155.123456
      expect(venue).to be_valid
    end
  end

  describe 'country' do
    it 'cannot be empty' do
      venue.country = nil
      expect(venue).to_not be_valid
    end

    it 'is invalid when not an ISO 3166 Alpha 2 Code' do
      venue.country = 'XXX'
      expect(venue).not_to be_valid
    end

    it 'is valid with upper or lowercase ISO 3166 Alpha 2 Code' do
      venue.country = 'us'
      expect(venue.iso3166_country.alpha2).to eq('US')
    end

    it 'is an instance of ISO3166::Country' do
      expect(venue.iso3166_country).to be_instance_of(ISO3166::Country)
    end
  end

  describe 'time_zone' do
    it 'cannot be empty' do
      venue.time_zone = nil
      expect(venue).to_not be_valid
    end

    it 'is valid when it conforms to TZ database format' do
      venue.time_zone = 'America/New_York'
      expect(venue).to be_valid
    end

    it 'is invalid when it does not conform to TZ database format' do
      venue.time_zone = 'Cal-Zone'
      expect(venue).to_not be_valid
    end
  end

  describe 'as_time_zone' do
    it 'is nil if time_zone is nil' do
      venue.time_zone = nil
      expect(venue.as_time_zone).to be_nil
    end

    it 'returns an instance of ActiveSupport::TimeZone if time_zone is set' do
      venue.time_zone = 'America/New_York'
      expect(venue.as_time_zone).to be_instance_of(ActiveSupport::TimeZone)
    end
  end
end
