class Admin::JobPostsController < Admin::AdminAreaController
  def index
    @job_posts = JobPost.all
  end
end
