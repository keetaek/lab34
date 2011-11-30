class CreateApplicationMediaJoinTable < ActiveRecord::Migration
  def change
    create_table :applications_medium, :id => false do |t|
      t.integer :application_id
      t.integer :media_id 
    end
  end
end
