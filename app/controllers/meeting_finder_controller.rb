class MeetingFinderController < ApplicationController
  def index
    render 'index', layout: false, status: :ok
  end
end
