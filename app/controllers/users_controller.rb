class UsersController < ApplicationController
  def index
   @user_list = User.all 
  end

  def new
    @user = User.new
    #    User.create(username: random_string, password: random_string, email: random_string, name: random_string, surname: random_string)
    #    redirect_to users_path
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def random_string
     ('a'..'z').to_a.shuffle[0..10].join
  end

  def find_user
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :password)
  end
end
