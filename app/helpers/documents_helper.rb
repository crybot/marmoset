module DocumentsHelper

  def create_and_write_file(document)
    dir = directory(document)
    Dir.mkdir(dir) unless File.directory?(dir)
    File.write(path(document), document.content)
  end

  def update_file(old_path, new_document)
    File.delete old_path
    File.write path(new_document), new_document.content
  end

  def read_file(document)
    File.read(path(document))
  end

  private
  def normalize(file_name)
    file_name.gsub(' ', '_')
  end
  
  def path(document)
    normalize(directory(document) + document.name)
  end

  def directory(document)
    normalize("uploads/" + document.classroom.name + "/")
  end

end
