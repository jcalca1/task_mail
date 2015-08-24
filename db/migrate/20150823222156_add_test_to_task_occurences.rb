class AddTestToTaskOccurences < ActiveRecord::Migration
  def change
    add_column :task_occurrences, :test, :integer
  end
end
