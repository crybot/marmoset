class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
    @content = read_file(@document)
  end

  def new
    @document = current_classroom.documents.build
  end

  def create
    @document = current_classroom.documents.build(document_params)
    if @document.save
      create_and_write_file(@document) #create and store local file

      flash[:success] = 'Document successfully created!'
      redirect_to current_classroom
    else
      flash.now[:danger] = 'Document could not be created.'
      render 'new'
    end
  end

  def destroy
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(document_params)
      flash[:success] = 'Document successfully updated!'
      redirect_to @document.classroom
    else
      flash.now[:danger] = 'Cannot update document.'
      render 'edit'
    end
  end

  def document_params
    params.require(:document).permit(:name, :content)
  end
end
