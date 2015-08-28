class AddUserToTaskOccurrences < ActiveRecord::Migration
  def change
    add_column :task_occurrences, :user_id, :string
  end
end
