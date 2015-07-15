   class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Successfully Logged Out"
    redirect_to root_path
  end

  def create
    username = params[:email]
    password = params[:password]


    @user = User.where(email: username).first

      if @user.password == (params[:password])
        
        session[:user_id] = @user.id
        flash[:alert] = "Welcome!"
        redirect_to user_path(current_user)
      else 
        flash[:alert] = "Incorrect credentials"
        redirect_to root_path  
      end
    end


end