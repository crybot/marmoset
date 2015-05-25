class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = current_classroom.documents.build
  end

  def create
    @document = current_classroom.documents.build(document_params)
    if @document.save
      flash[:success] = 'Document successfully created!'
    else
      flash[:danger] = 'Document could not be created.'
    end
    redirect_to current_classroom
  end

  def destroy
  end

  def document_params
    params.require(:document).permit(:name, :content)
  end
end
