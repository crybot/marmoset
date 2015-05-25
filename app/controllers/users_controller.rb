class UsersController < ApplicationController
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

end
