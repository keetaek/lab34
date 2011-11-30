class Role < ActiveRecord::Base
  belongs_to :audition
  has_many :applications
  has_many :medium, :through => :applications
  has_many :role_questions
  
end
