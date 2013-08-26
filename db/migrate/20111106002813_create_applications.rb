class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      # t.integer :role_id Note: removing 
      t.integer :audition_id
      t.integer :user_id
      t.text :answers
      t.timestamps
    end
  end
end
