class CreateAuditionUserJoinTable < ActiveRecord::Migration
  def change
    create_table :auditions_users, :id => false do |t|
      t.integer :audition_id
      t.integer :user_id
    end
  end
end
