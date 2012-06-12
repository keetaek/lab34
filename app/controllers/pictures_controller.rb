class PicturesController < InheritedResources::Base
  belongs_to :user, :polymorphic => true
  def create
    create! do |format|
      format.html { redirect_to collection_url }
    end
  end
end
