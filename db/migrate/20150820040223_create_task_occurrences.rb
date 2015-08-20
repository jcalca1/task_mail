class CreateTaskOccurrences < ActiveRecord::Migration
  def change
    create_table :task_occurrences do |t|
      t.boolean :complete
      t.integer :task_id

      t.timestamps

    end
  end
end
