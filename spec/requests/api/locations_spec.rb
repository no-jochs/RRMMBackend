require 'rails_helper'

RSpec.describe 'Api::Locations', type: :request do
  before(:all) do
    10.times { create(:location) }
  end

  describe 'GET /api/locations' do
    before(:each) { get '/api/locations' }

    it 'returns a HTTP success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns JSON response' do
      expect(response).to have_content_type_json
    end

    it 'returns all locations' do
      expect(response).to contain_json_array_with_length(Location.count)
    end
  end
end
