class UsersController < ApplicationController
  before_action :logged_user, only: [:show]
  before_action :right_user, only: [:show]

  def index
    @user_list = User.all 
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @classroom = @user.classrooms.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = "Congratulations! You are now registered."
      redirect_to @user
    else
      render new_user_path
    end
  end

  #def random_string
  #('a'..'z').to_a.shuffle[0..10].join
  #end

  private
  def user_params
    params.require(:user).permit(:name, :surname, :email, :password)
  end

  def right_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = "You do not have permissions to access this page."
      redirect_to current_user
    end
  end

end
