class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def show
  end

  def new
    @document = Document.new
  end

  def create
  end

  def destroy
  end
end
