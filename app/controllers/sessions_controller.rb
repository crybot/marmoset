class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase);
    if user && user.password == params[:session][:password]
      #log in 
    else
      flash.now[:danger] = 'Invalid Email or Password'
      render 'new'
    end
  end

  def destroy
  end
end
