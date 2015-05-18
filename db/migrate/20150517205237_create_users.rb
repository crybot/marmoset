class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.text :name
      t.text :surname

      t.timestamps null: false
    end
  end
end
