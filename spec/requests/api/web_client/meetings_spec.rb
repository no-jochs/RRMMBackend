require 'rails_helper'

RSpec.describe 'Api::WebClient::Meetings', type: :request do
  before(:all) { 10.times { create(:meeting) } }

  describe 'GET /api/web_client/meetings' do
    before(:each) { get '/api/web_client/meetings' }

    it 'returns an HTTP success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a JSON response' do
      expect(response).to have_content_type_json
    end

    it 'returns a JSON list of all locations' do
      expect(response).to contain_json_array_with_length(Meeting.count)
    end

    it 'returns meetings with associated locations' do
      meetings = JSON.parse(response.body)
      expect(meetings.all? { |m| m.key?('location') }).to be(true)
      expect(meetings.pluck('location')).to all(be_a(Hash))
    end
  end
end
