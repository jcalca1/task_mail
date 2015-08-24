class AddDetailsToTaskOccurrences < ActiveRecord::Migration
  def change
    add_column :task_occurrences, :task_next_num, :integer
    add_column :task_occurrences, :task_next_date, :datetime
    add_column :task_occurrences, :complete_date, :datetime
  end
end
