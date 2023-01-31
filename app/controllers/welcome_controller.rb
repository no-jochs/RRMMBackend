class WelcomeController < ApplicationController
  def index
    render 'index', status: :ok
  end
end
