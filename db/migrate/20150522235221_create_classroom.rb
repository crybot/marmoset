class CreateClassroom < ActiveRecord::Migration
  def change
    create_table :classrooms_users, id: false  do |t|
      t.belongs_to :user, index: true
      t.belongs_to :classroom, index: true
    end
  end
end
