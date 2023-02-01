class MeetingFinderController < ApplicationController
  def index
    render 'index', layout: :none, status: :ok
  end
end
