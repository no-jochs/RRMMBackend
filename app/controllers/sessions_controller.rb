class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      render json: @user, status: :ok
    else
      render json: { errors: ['Incorrect credentials.'] }.to_json, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    render json: { message: 'Logged out.' }, status: :ok
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
