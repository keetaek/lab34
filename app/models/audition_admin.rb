class AuditionAdmin < ActiveRecord::Base
  belongs_to :user
  belongs_to :audition
  
  validates_confirmation_of :email #this check if :email == :email_confirmation
  
end
