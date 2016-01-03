class SessionsController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
  end

  def create
    user = User.find_by(username: username_param)
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
      params[:session][:username]
    end

    def password_param
      params[:session][:password]
    end

end