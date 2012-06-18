# note that PicturesController is using InheritedResources::Base
# This will 
# 1. Remove all the redundant boilerplate controller code
# 2. Manage polymorphic belongs_to relation which manages path like
# /users/1/pictures/2 
class PicturesController < InheritedResources::Base
  belongs_to :user,:application, :polymorphic => true, :optional => true

  # Commented out in favor of jquery version
  # def create
  #   create! do |format|
  #     format.html { redirect_to collection_url }
  #   end
  # end

  # def smart_create
  def create
    create! do |success, failure|
        success.html {  
          # render :json => [@picture.to_jq_upload].to_json, 
          # :content_type => 'text/html',
          # :layout => false
          redirect_to collection_url
        }
        success.json {
          render :json => [@picture.to_jq_upload].to_json
        }
        failure.json {
          render :json => [{:error => "custom_failure"}], :status => 304
        }
  end
end

  ##smart_destroy: Used to support JSON based delete
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    render :json => true
  end

end
