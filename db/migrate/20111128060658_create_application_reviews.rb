class CreateApplicationReviews < ActiveRecord::Migration
  def change
    create_table :application_reviews do |t|
      t.integer :score
      t.text :comment
      t.integer :application_id
      t.integer :audition_admin_id

      t.timestamps
    end
  end
end
