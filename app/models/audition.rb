class Audition < ActiveRecord::Base
  attr_accessible :title, :audition_type, :logo, :description, :status, :deadline_date, :zip, :roles_attributes, :audition_admin_attributes, :users_attributes
  
  has_and_belongs_to_many :users
  # has_many :roles, :dependent => :destroy
  has_many :audition_admins, :dependent => :destroy
  has_many :applications, :dependent => :destroy

  # TODO: Uncomment the below items after initial prototype
  # accepts_nested_attributes_for :roles, :reject_if => lambda { |a| a[:title].blank? && a[:description].blank? }, :allow_destroy => true
  # accepts_nested_attributes_for :audition_admins, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
  mount_uploader :logo, ImageUploader
end
