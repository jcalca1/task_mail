class TaskOccurrence < ActiveRecord::Base
   validates :task_id, :presence => true
  belongs_to :tasks
end
