class JobPost < ActiveRecord::Base
  belongs_to :location
  belongs_to :category

  has_many :job_applications
  has_many :tags

  state_machine :initial => :not_approved do
    # before_transition :parked => any - :parked, :do => :put_on_seatbelt
  end

end
