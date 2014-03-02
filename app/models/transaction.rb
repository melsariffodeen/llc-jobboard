class Transaction < ActiveRecord::Base
  belongs_to :job_post

  serialize :stripe_response, JSON
end
