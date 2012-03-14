class CreateAuditionAdmins < ActiveRecord::Migration
  def change
    create_table :audition_admins do |t|
      t.integer :user_id
      t.integer :audition_id
      t.string :email
      t.timestamps
    end
  end
end
