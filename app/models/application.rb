class Application < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :medium
  has_many :application_question_answers
end
