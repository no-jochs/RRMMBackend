require 'rails_helper'

RSpec.describe "MeetingFinders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/meeting_finder/index"
      expect(response).to have_http_status(:success)
    end
  end

end
