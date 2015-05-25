class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :content
      t.string :author_email

      t.timestamps null: false
    end
  end
end
