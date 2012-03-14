class CreateApplicationPictureJoinTable < ActiveRecord::Migration
  def change
    create_table :applications_pictures, :id => false do |t|
      t.integer :application_id
      t.integer :picture_id 
    end
  end
end
