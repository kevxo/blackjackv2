class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/', notice: user.errors.full_messages.first
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
