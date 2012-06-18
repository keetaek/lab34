class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
   	  t.string :title
      # t.text :description
      t.boolean :private
      t.string :image
      t.integer :user_id
      t.integer :application_id
      t.timestamps
    end
  end
end
