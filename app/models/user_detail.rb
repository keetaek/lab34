class UserDetail < ActiveRecord::Base
  #TODO: Optimize relationship with User table
  #currently not being used
  belongs_to :user
  
end
