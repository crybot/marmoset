class ClassroomsController < ApplicationController
  include Git
  before_action :logged_user
  before_action :right_user, only: [:show]

  def index
    @classrooms = Classroom.all
  end

  def show
    @classroom = Classroom.find(params[:id])
    save_classroom(@classroom)
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      #create_repo(normalize(@classroom.name))
      current_user.classrooms << @classroom
      flash[:success] = 'Classroom successfully created!'
    else
      flash[:danger] = 'Classroom could not be created.'
    end
    redirect_to current_user
  end

  def associate
    @classroom = Classroom.find(params[:id])
    unless @classroom.nil? || current_user.classrooms.include?(@classroom)
      current_user.classrooms << @classroom 
      flash[:success] = 'Classroom successfully joined!'
      redirect_to @classroom
    else
      flash[:danger] = 'Already joined or unexisting classroom.'
      redirect_to classrooms_path
    end

  end

  def destroy
  end

  private
  def classroom_params
    params.require(:classroom).permit(:name)
  end

  def right_user
    @classroom = Classroom.find(params[:id])
    unless current_user.classrooms.include?(@classroom)
      flash[:danger] = "You are not member of this class."
      redirect_to current_user
    end
  end

end
