class Admin::JobPostsController < Admin::AdminAreaController
  before_action :load_job_post, only: [:approve, :hide_or_show, :reject]

  def index
    @job_posts = JobPost.all
  end

  def reject
    @job_post.reject
    redirect_to :admin_job_posts
  end

  def approve
    @job_post.approve
    redirect_to :admin_job_posts
  end

  def hide_or_show
    if @job_post.hidden?
      @job_post.show
    elsif @job_post.approved?
      @job_post.hide
    end
    redirect_to :admin_job_posts
  end

  private
  def load_job_post
    @job_post = JobPost.find(params[:id])
  end
end
