class Company < ActiveRecord::Base
  attr_accessible :name, :abbr
  
  has_many :users
  
  validates :name,  :presence   => true
  validates :abbr,  :presence   => true,
					:length     => { :within => 5..5 },
					:uniqueness => { :case_sensitive => false }
  
end
