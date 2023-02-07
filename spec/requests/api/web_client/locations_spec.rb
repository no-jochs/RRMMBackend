require 'rails_helper'

RSpec.describe 'Api::WebClient::Locations', type: :request do
  xdescribe 'GET /api/web_client/locations' do
    before(:each) { get '/api/web_client/locations' }

    it 'returns an HTTP success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a JSON response' do
      expect(response).to have_content_type_json
    end

    it 'returns a JSON list of all locations' do
      expect(response).to contain_json_array_with_length(Location.count)
    end
  end
end
