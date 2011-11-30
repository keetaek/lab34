class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.text :description
      t.string :attachment
      t.integer :audition_id
      t.timestamps
    end
  end
end
