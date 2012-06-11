# encoding: utf-8

class ThumbnailUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick

  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :thumb do
    resize_to_fill(100, 100)
  end
  
  version :small_thumb, :from_version => :thumb do
    resize_to_fill(20, 20)
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end