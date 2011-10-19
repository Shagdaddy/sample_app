class Candidate < ActiveRecord::Base
  belongs_to :user

  validates :first_name,     :presence   => true,
						     :length     => { :maximum => 35}
  validates :last_name,      :presence   => true,
						     :length     => { :maximum => 35}

end
