class AddMediaResourceToMedium < ActiveRecord::Migration
  def self.up
    change_table :media do |t|
      t.references :media_resource, :polymorphic => true
    end
  end
  def self.down
    remove_column :media, :media_resource_type
    remove_column :media, :media_resource_id
  end
end
