class Admin::JobPostsController < Admin::AdminAreaController
  def index
    @job_posts = JobPost.all
  end

  def approve
    @job_post = JobPost.find(params[:id])

    if @job_post.approve
      redirect_to :admin_job_posts
    else
      redirect_to :admin_job_posts
    end
  end
end
