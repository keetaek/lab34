class Role < ActiveRecord::Base
  belongs_to :audition
  has_many :applications
  has_many :medium, :through => :applications
  has_many :role_questions, :dependent => :destroy
  accepts_nested_attributes_for :role_questions, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true
end
