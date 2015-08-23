class Task < ActiveRecord::Base
  has_many:task_occurences
end
