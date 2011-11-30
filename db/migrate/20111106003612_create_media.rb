class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.boolean :private
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
