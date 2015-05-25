class ClassroomsController < ApplicationController
  def index
  end

  def show
    @classroom = Classroom.find(params[:id])
  end

  def new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      current_user.classrooms << @classroom
      redirect_to current_user
    else
      flash[:danger] = 'Classroom could not be created.'
      redirect_to current_user
    end
  end

  def destroy
  end

  private
  def classroom_params
    params.require(:classroom).permit(:name)
  end
end
