class User < ActiveRecord::Base
  # Include default devise modules. Others available are: 222222
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :tasks, :through => :task_occurrences
 has_many :task_occurrences

end
