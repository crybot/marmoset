module UsersHelper

  def logged_user
    unless logged?
      save_forward_url
      flash[:danger] = "Please log in to visit this page."
      redirect_to login_path
    end
  end

end
