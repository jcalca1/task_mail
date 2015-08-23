class Task < ActiveRecord::Base
validates :name, :presence => true, :uniqueness => { :scope => :date }
  has_many :task_occurences
end
