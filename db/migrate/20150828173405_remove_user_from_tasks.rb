class RemoveUserFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :user_id, :string
  end
end
