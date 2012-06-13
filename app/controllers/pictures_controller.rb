# note that PicturesController is using InheritedResources::Base
# This will 
# 1. Remove all the redundant boilerplate controller code
# 2. Manage polymorphic belongs_to relation which manages path like
# /users/1/pictures/2 
class PicturesController < InheritedResources::Base
  belongs_to :user, :polymorphic => true, :optional => true
  def create
    create! do |format|
      format.html { redirect_to collection_url }
    end
  end
end
