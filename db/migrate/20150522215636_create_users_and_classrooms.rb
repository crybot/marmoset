class CreateUsersAndClassrooms < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :name
      t.text :surname
      t.string :email
      t.string :password

      t.timestamps null: false
    end

    change_table :classrooms  do |t|
      t.text :name

      t.timestamps null: false
    end

    drop_table :users_classrooms
    create_table :classrooms_users, id: false  do |t|
      t.belongs_to :user, index: true
      t.belongs_to :classroom, index: true
    end
  end
end
