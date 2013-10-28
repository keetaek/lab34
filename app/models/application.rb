class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :audition
  # why make user_id, role_id, and audition_id open? It is difficult to get all those associations updated. We are now simply inserting it.
  attr_accessible :video_path, :picture_path, :answers, :user_id, :role_id, :audition_id
  validates_uniqueness_of :role_id, :scope => [:user_id]
  # attr_accessible :pictures_attributes, :videos_attributes, :application_question_answers_attributes, :answers
  # belongs_to :role
  # Media field has been deprecated
  # has_and_belongs_to_many :medium 
  # has_many :pictures, :dependent => :destroy
  # has_many :videos, :dependent => :destroy
  # has_many :application_question_answers, :dependent => :destroy
  # accepts_nested_attributes_for :pictures, :allow_destroy => true
  # accepts_nested_attributes_for :videos, :allow_destroy => true
  # accepts_nested_attributes_for :application_question_answers, :allow_destroy => true
end
