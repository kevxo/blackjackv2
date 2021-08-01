class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/', notice: 'Wrong Username or Password'
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to '/'
  end
end
