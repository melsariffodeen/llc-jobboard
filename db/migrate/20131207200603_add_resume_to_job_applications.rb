class AddResumeToJobApplications < ActiveRecord::Migration
  def self.up
    add_attachment :job_applications, :resume
  end

  def self.down
    remove_attachment :job_applications, :resume
  end
end
