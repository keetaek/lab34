class Audition < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :roles, :dependent => :destroy
  has_many :audition_admins
  accepts_nested_attributes_for :roles, :reject_if => lambda { |a| a[:title].blank? && a[:description].blank? }, :allow_destroy => true
end
