class Medium < ActiveRecord::Base
  belongs_to :media_resource, :polymorphic => true
  belongs_to :user
  has_and_belongs_to_many :applications
end
