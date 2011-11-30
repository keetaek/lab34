class UserDetail < ActiveRecord::Base
  #TODO: Optimize relationship with User table
  belongs_to :user
end
