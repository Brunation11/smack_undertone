class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username_param)
    if user && user.authenticate(password_param)
      session[:user_id] = user.user_id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def username_param
      param.require(:session).permit(:username)
    end

    def password_param
      param.require(:session).permit(:password)[:password]
    end

end