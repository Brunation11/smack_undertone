class UsersController < ApplicationController

  def new
    @user = User.new
    if request.xhr?
      render :new, layout: false
    else
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if request.xhr?
        session[:user_id] = @user.id
        render 'questions/newest', layout: false
      else
        session[:user_id] = @user.id
        redirect_to root_path
      end
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
