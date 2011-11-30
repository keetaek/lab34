class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.text :summary
      t.string :phone
      t.integer :view_count
      t.string :thumbnail
      t.string :website1
      t.string :website2

      t.timestamps
    end
  end
end
