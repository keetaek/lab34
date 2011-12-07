class User < ActiveRecord::Base
  attr_accessible :email, :password, :firstName, :lastName
  has_secure_password
 
  has_and_belongs_to_many :auditions
  has_one :user_detail
  has_many :audition_admins
  has_many :applications
  has_many :media, :as => :media_resource #polymophic relationship
  
  validates_confirmation_of :password
  validates_presence_of :email, :password, :firstName, :lastName, :on => :create, :message => "Can't be blank"
  validates_uniqueness_of :email

end
