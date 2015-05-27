class ChangeDocumentsTable < ActiveRecord::Migration
  def change
    remove_column :documents, :content
  end
end
