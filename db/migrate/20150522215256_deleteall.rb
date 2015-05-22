class Deleteall < ActiveRecord::Migration
  def up
    drop_table :users
    drop_table :classrooms
    drop_table :users_classrooms
  end
end
