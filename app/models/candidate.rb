class Candidate < ActiveRecord::Base
  belongs_to :user
  has_many :submissions

  validates :first_name,     :presence   => true,
						     :length     => { :maximum => 35}
  validates :last_name,      :presence   => true,
						     :length     => { :maximum => 35}

  def full_name
    "#{first_name} #{last_name} (id=#{id})"
  end
  
end
