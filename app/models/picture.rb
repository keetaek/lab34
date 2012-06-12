class Picture < ActiveRecord::Base
  # extend MediaResource
  # acts_as_media
  
  attr_accessible :image;
  validates :image, :presence => true

  mount_uploader :image, ImageUploader
  belongs_to :user, :polymorphic => true
  has_and_belongs_to_many :applications

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:title),
      "private" => read_attribute(:private),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
