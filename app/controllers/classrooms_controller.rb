class ClassroomsController < ApplicationController
  def index
  end

  def show
    @classroom = Classroom.find(params[:id])
    save_classroom(@classroom)
  end

  def new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      current_user.classrooms << @classroom
      flash[:success] = 'Classroom created sucessfully!'
    else
      flash[:danger] = 'Classroom could not be created.'
    end
    redirect_to current_user
  end

  def destroy
  end

  private
  def classroom_params
    params.require(:classroom).permit(:name)
  end
end
