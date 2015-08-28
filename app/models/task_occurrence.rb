class TaskOccurrence < ActiveRecord::Base
   validates :task_id, :presence => true

  belongs_to :task
belongs_to :user
end
