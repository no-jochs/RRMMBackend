class Api::WebClient::LocationsController < ApplicationController
  def show
    @location = Location.includes(:meetings).find(params[:id])
    render json: @location, status: :ok
  end
end
