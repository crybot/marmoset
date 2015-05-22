class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase);
    if user && user.password == params[:session][:password]
      login user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid Email or Password'
      render 'new'
    end
  end

  def destroy
    logout if logged?
    redirect_to root_path
  end
end
