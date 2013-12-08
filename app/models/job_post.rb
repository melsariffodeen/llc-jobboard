class JobPost < ActiveRecord::Base
  belongs_to :category
  belongs_to :job_type

  has_many :job_applications

  acts_as_taggable

  has_one :location
  accepts_nested_attributes_for :location

  scope :by_category, lambda { |category_id| where("category_id = ?", category_id) }
  scope :by_job_type, lambda { |job_type_id| where("job_type_id = ?", job_type_id) }
  scope :active, lambda { where("state = 'approved'") }

  state_machine :initial => :not_approved do
    before_transition :not_approved => :approved, :do => :capture_payment

    event :approve do
      transition [:not_approved, :rejected] => :approved
    end

    event :reject do
      transition all => :rejected
    end

    event :expire do
      transition all => :expired
    end

    event :hide do
      transition :approved => :hidden 
    end

    event :show do
      transition :hidden => :approved 
    end
  end

  def capture_payment
    
  end
end
