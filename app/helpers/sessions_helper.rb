module SessionsHelper
  def save_classroom(classroom)
    session[:classroom_id] = classroom.id
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete :user_id
    @current_user = nil
  end

  def current_user 
    @current_user = @current_user or User.find_by(id: session[:user_id])
  end

  def current_classroom
    @current_classroom = Classroom.find_by(id: session[:classroom_id])
  end

  def logged?
    !current_user.nil?
  end
end
