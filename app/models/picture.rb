class Picture < ActiveRecord::Base
  extend MediaResource
  acts_as_media
  
  attr_accessible :image;
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_and_belongs_to_many :applications
end
