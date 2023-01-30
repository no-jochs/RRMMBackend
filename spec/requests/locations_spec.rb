require 'rails_helper'

RSpec.describe 'Locations', type: :request do
  before(:all) do
    10.times { create(:location) }
  end

  describe 'GET /api/locations' do
    it 'returns JSON response' do
      get '/api/locations'
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns all locations' do
      get '/api/locations'
      expect(JSON.parse(response.body).count).to eq(Location.count)
    end
  end
end
