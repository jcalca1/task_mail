class AddNotesToTAskOccurences < ActiveRecord::Migration
  def change
    add_column :task_occurrences, :task_notes, :text
  end
end
