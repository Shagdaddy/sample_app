class Submission < ActiveRecord::Base

  attr_accessible :stage, :delta, :comments, :candidate_id

  belongs_to :user
  belongs_to :order
  
  has_one :candidate, :through => :users
  
end
