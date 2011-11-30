class AuditionAdmin < ActiveRecord::Base
  belongs_to :user
  belongs_to :audition
  
end
