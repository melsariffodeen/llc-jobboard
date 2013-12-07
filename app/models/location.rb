class Location < ActiveRecord::Base
  has_many :job_posts
end
