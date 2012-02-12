class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.text :description
      t.string :attachment
      t.integer :audition_id
      t.date :job_start_date
      t.date :job_end_date
      t.timestamps
    end
  end
end
