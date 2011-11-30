class CreateApplicationQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :application_question_answers do |t|
      t.text :answer
      t.integer :application_id
      t.integer :role_question_id
      t.timestamps
    end
  end
end
