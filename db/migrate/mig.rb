class CreateUsersAndClassrooms < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :surname
      t.string :email
      t.string :password

      t.timestamps null: false
    end

    create_table :classrooms  do |t|
      t.text :name

      t.timestamps null: false
    end

    create_table :users_classrooms  do |t|
      t.belongs_to :user, index: true
      t.belongs_to :classroom, index: true
    end
  end
end