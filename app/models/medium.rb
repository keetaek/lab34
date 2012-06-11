class Medium < ActiveRecord::Base
  attr_accessible :title, :private, :description;
  belongs_to :media_resource, :polymorphic => true
  #belongs_to :user
  #has_and_belongs_to_many :applications
end