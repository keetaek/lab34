class ApplicationsController < InheritedResources::Base
  belongs_to :role, :polymorphic => true, :optional => true
  def create
    create! do |format|
      format.html { redirect_to collection_url }
    end
  end
end
