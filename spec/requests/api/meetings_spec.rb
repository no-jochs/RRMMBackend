require 'rails_helper'

RSpec.describe 'Api::Meetings', type: :request do
  before(:all) { 10.times { create(:meeting) } }

  describe 'GET /api/meetings' do
    it 'returns a JSON response' do
      get '/api/meetings'
      expect(response).to have_content_type_json
    end

    it 'returns http success' do
      get '/api/meetings'
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct number of meetings' do
      get '/api/meetings'
      expect(response).to contain_json_array_with_length(Meeting.count)
    end
  end
end
