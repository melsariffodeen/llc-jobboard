class JobApplication < ActiveRecord::Base
  belongs_to :job_post

  has_attached_file :resume
end
