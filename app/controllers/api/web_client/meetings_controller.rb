class Api::WebClient::MeetingsController < ApplicationController
  def index
    @meetings = Meeting.includes(:location).all
    render json: @meetings, status: :ok
  end
end
