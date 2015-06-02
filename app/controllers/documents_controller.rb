class DocumentsController < ApplicationController
  #include Git
  before_action :logged_user, only: [:new, :create, :destroy, :edit, :update]

  def show
    @document = Document.find(params[:id])
    #@content = read_file(@document)
  end

  def new
    @document = current_classroom.documents.build
  end

  def create
    @document = current_classroom.documents.build(document_params)
    if @document.save
      # heroku does not support local file writing
      #create_and_write_file(@document) #create and store local file
      #add_file(normalize(@document.name), normalize(@document.content))

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
    #old_path = path(@document)
    if @document.update_attributes(document_params)
      #update_file(old_path, @document)

      flash[:success] = 'Document successfully updated!'
      redirect_to @document.classroom
    else
      flash.now[:danger] = 'Cannot update document.'
      render 'edit'
    end
  end

  private
  def document_params
    params.require(:document).permit(:name, :content)
  end
end
