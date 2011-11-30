class ApplicationQuestionAnswer < ActiveRecord::Base
  belongs_to :application
  belongs_to :role_question
end
