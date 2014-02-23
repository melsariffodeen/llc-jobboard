require 'test_helper'

class JobPostTest < ActiveSupport::TestCase
  def setup
    @job_post = job_posts(:posting)
  end

  test "#hide_expired hides expired job postings" do
    @job_post.update_attributes(expires_at: Time.now - 1.hour)
    @job_post.approve

    JobPost.hide_expired

    assert @job_post.reload.expired?
  end
end
