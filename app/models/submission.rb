class Submission < ActiveRecord::Base

  belongs_to :user
  belongs_to :order
  
  has_one :candidate, :through => :users
  
end
