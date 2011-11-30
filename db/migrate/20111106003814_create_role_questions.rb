class CreateRoleQuestions < ActiveRecord::Migration
  def change
    create_table :role_questions do |t|
      t.string :question
      t.integer :role_id
      t.timestamps
    end
  end
end
