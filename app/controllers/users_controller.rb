class UsersController < ApplicationController
def index 
      @users = User.all
   end

   def new 
      @user = User.new
   end
  
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:notice] = "Thanks for Signing Up"
      session[:user_id] = @user.id
      redirect_to show_path
    else
      flash[:alert] = "Something went wrong, check errors below"
      render :new
    end
  end

  def show 
   @user = User.find(params[:id])
  end


  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update! user_params
    flash[:notice] = "successful update"
    redirect_to user_path(@user)
  end


  private
  def user_params
   params.require(:user).permit(:email, :phone, :fname, :lname, :balance, :password, :password_confirmation)
end
end

