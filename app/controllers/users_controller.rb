class UsersController < ApplicationController
  def index
   @user_list = User.all 
  end

  def find_user
  end
end
