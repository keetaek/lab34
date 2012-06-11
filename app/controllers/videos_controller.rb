class VideosController < ApplicationController
  
  def index
    @videos = Video.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @videos }
    end
  end
  
  def show
    @video = Video.find(params[:id])
    @panda_video = @video.panda_video
    debugger
    @h264_encoding = find_h264_encoding(@panda_video)
    @ogg_encoding = find_ogg_encoding(@panda_video)

  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.create!(params[:video])
    redirect_to :action => :show, :id => @video.id
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
