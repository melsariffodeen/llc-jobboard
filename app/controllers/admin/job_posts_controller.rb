class Admin::JobPostsController < Admin::AdminAreaController
  before_action :load_job_post, only: [:approve, :next_action]

  def index
    @job_posts = JobPost.all
  end

  def reject
    @job_post.reject

    redirect_to :admin_job_posts
  end

  def next_action
    case @job_post.state
    when 'not_approved' then @job_post.approve
    end
    
    redirect_to :admin_job_posts
  end

  private
  def load_job_post
    @job_post = JobPost.find(params[:id])
  end
end
