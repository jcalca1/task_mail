class AddTestToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :test, :integer
  end
end
