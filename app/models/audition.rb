class Audition < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessible :title, :audition_type, :logo, :description, :status, :deadline_date, :zip, :roles_attributes, :users_attributes
  
  # Only belongs to a single host
  belongs_to :host, :class_name => "User", :foreign_key => "host_id"
  # has many applicants
  has_many :roles, :dependent => :destroy
  has_many :applications
  has_many :applicants, through: :applications, :source => :user

  validates_presence_of :title, :audition_type, :description, :zip, :on => :create, :message => "The field cannot be blank"

  # TODO: Uncomment the below items after initial prototype
  accepts_nested_attributes_for :roles, :reject_if => lambda { |a| a[:title].blank? && a[:description].blank? }, :allow_destroy => true
  # accepts_nested_attributes_for :audition_admins, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
  # mount_uploader :logo, ImageUploader
  # TODO : Probably need to remove application from getting pulled in every time.
  def as_json(options={})
    super(:include => {:roles => {:include => :applications}})
  end
end
