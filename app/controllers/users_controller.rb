class UsersController < ApplicationController
  
  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    user_params[:email].downcase!
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :root  
    else
      @user.errors
      render :new
    end
    
  end



  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :quirk, :password, :password_confirmation)
  end
end
