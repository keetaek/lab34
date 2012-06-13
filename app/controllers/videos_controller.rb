# note that VideosController is using InheritedResources::Base
# This will 
# 1. Remove all the redundant boilerplate controller code
# 2. Manage polymorphic belongs_to relation which manages path like
# /users/1/videos/2 
class VideosController < InheritedResources::Base
  belongs_to :user, :polymorphic => true, :optional => true
  
  def show
    @video = Video.find(params[:id])
    @panda_video = @video.panda_video
    @h264_encoding = find_h264_encoding(@panda_video)
    @ogg_encoding = find_ogg_encoding(@panda_video)
  end
  
  #Redirect to the collection path (or index path) after creation
  def create
    create! do |format|
      format.html { redirect_to collection_url }
    end
  end


  private
  def find_h264_encoding(video)
    name = %w{h264.hi h264 h264.lo}.find do |name|
      video.encodings.find_by_profile_name(name)
    end
    video.encodings.find_by_profile_name(name)
  end
  
  def find_ogg_encoding(video)
    name = %w{ogg.hi ogg ogg.lo}.find do |name|
      video.encodings.find_by_profile_name(name)
    end
    video.encodings.find_by_profile_name(name)
  end
end
