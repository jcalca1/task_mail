class Task < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => { :scope => :date }
  validates :date, :presence => true

  if :recurrence == true
    validates :recurrence_frequency_num, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000 }
    validates :recurrence_end_num, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }
  else
  end

  has_many :task_occurrences, :dependent => :destroy
end
