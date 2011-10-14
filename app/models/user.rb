class User < ActiveRecord::Base
  attr_accessible :email, :password, :firstName, :lastName
  has_secure_password
  
  validates_confirmation_of :password
  validates_presence_of :email, :password, :firstName, :lastName, :on => :create, :message => "Can't be blank"
  validates_uniqueness_of :email
end
