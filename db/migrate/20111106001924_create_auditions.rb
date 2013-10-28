class CreateAuditions < ActiveRecord::Migration
  def change
    create_table :auditions do |t|
      t.integer :host_id
      t.string :title
      t.string :audition_type
      t.string :logo
      t.text :description
      t.string :status
      t.datetime :deadline_date
      t.string :zip
      t.timestamps
    end
  end
end
