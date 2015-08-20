class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.boolean :email_reminder_repeat
      t.integer :email_reminder_num
      t.boolean :email_reminder
      t.integer :recurrence_end_num
      t.string :recurrence_end_period
      t.string :recurrence_frequency_period
      t.integer :recurrence_frequency_num
      t.boolean :recurrence
      t.text :notes
      t.datetime :date
      t.string :name

      t.timestamps

    end
  end
end
