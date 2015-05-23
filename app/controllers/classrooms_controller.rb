class ClassroomsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      current_user.classrooms << @classroom
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
