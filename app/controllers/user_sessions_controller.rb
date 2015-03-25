class UserSessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    email = params[:email].downcase
    if @user = login(email, params[:password])
      redirect_back_or_to(:root, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end


  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end
end
