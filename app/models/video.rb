class Video < ActiveRecord::Base
  # Removing MTI (Multi Table inheritance), for simpler structure
  # extend MediaResource
  # acts_as_media

  #Panda also provides a Panda::Video, but we wrap it in our own ActiveRecord
  #class in order to get local storage, and so that we can add our own
  #associations and metadata.
  attr_accessible :title, :description, :private
  belongs_to :videoable, :polymorphic => true
  # belongs_to :user
  # has_and_belongs_to_many :applications
  #Provide access to the wrapped object
  # def panda_video
  #   @panda_video ||= Panda::Video.find(panda_video_id)
  # end
end
