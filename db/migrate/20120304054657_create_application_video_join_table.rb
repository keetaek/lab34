class CreateApplicationVideoJoinTable < ActiveRecord::Migration
  def change
    create_table :applications_videos, :id => false do |t|
      t.integer :application_id
      t.integer :video_id 
    end
  end
end
