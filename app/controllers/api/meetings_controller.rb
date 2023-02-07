class Api::MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
    render json: @meetings, status: :ok
  end
end
