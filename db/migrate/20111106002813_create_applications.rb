class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :role_id
      t.integer :user_id
      t.timestamps
    end
  end
end
