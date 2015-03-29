class UsersController < ApplicationController
  
  def index
    @user = User.new
  end

  def show
    @my_teams = current_user.teams
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
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

  def update
    respond_to do |format|
      if @user.update(user_params)  
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :quirk, :password, :password_confirmation)
  end
end
