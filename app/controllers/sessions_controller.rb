class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase);
    if user && user.password == params[:session][:password]
      if user.activated?
	login user
	redirect_forward_or user
      else
	message  = "Account not activated. "
	message += "Check your email for the activation link."
	flash[:danger] = message
	redirect_to root_path
      end
    else
      flash.now[:danger] = 'Invalid Email or Password'
      render 'new'
    end
  end

  def destroy
    logout if logged?
    flash[:info] = "Logged out succesfully"
    redirect_to root_path
  end
end
