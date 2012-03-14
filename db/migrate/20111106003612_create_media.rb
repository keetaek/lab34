class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.boolean :private
      t.text :description
      t.timestamps
    end
  end
end
