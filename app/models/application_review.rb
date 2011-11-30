class ApplicationReview < ActiveRecord::Base
  belongs_to :audition_admin
  belongs_to :application
end
