class DocumentsController < ApplicationController
  def show
  end

  def new
    @document = Document.new
  end

  def create
    classroom = current_classroom
    parameters = document_params
    parameters[:author_email] = current_user.email
    @document = classroom.documents.build(document_params)
    if @document.save
      flash[:success] = 'Document created successfully!'
    else
      flash[:danger] = 'Document could not be created.'
    end
    redirect_to classroom
  end

  def destroy
  end

  def document_params
    params.require(:document).permit(:name, :content)
  end
end
