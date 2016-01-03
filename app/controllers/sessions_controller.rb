class SessionsController < ApplicationController

  def new
    @user = User.find_or_initialize_by(username_param)
  end

  def create
    user = User.find_by(username_param)
    if user && user.authenticate(password_param)
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def username_param
      params.permit(:username)
    end

    def password_param
      params.permit(:password)[:password]
    end

end