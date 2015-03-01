class UsersController < ApplicationController
  
  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end



  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :quirk, :password, :password_confirmation)
  end
end
