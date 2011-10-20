class Order < ActiveRecord::Base
  belongs_to :user
  has_many :submissions

  validates :job_title,      :presence   => true,
						     :length     => { :maximum => 35}
  validates :job_type,       :presence   => true,
						     :length     => { :maximum => 15}
  validates :position_max,   :presence => true,
# assumed				     :numericality => true,
							 :numericality => { :greater_than => 1 }
  validates :stage,          :presence => true,
# assumed				     :numericality => true,
							 :numericality => { :greater_than => 3, :less_than_or_equal_to => 9 }

end
