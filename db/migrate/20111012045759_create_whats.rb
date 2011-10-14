class CreateWhats < ActiveRecord::Migration
  def change
    create_table :whats do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
