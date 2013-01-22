class ApplicationsController < InheritedResources::Base
  belongs_to :role,:user, :polymorphic => true, :optional => true
  def create
    create! do |format|
      format.html { redirect_to collection_url }
    end
  end
  def new 
  	# @application = Application.new
  	debugger
  	# @application.videos.build
    new! #Original 
  end
end
