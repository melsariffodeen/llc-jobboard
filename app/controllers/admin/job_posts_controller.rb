class Admin::JobPostsController < Admin::AdminAreaController
  before_action :load_job_post, only: [:activate, :hide_or_show, :reject]

  def index
    @job_posts = JobPost.all
  end

  def reject
    @job_post.reject
    redirect_to :admin_job_posts
  end

  def activate
    @job_post.activate
    redirect_to :admin_job_posts
  end

  def hide_or_show
    if @job_post.hidden?
      @job_post.show
    elsif @job_post.active?
      @job_post.hide
    end
    redirect_to :admin_job_posts
  end

  def new
    @job_post = JobPost.new
    @categories = Category.all
    @job_types = JobType.all
  end

  def create
    @job_post = current_admin.job_posts.new(job_post_params)
    @categories = Category.all
    @job_types = JobType.all

    if @job_post.save
      @job_post.activate
      redirect_to @job_post
    else
      render 'new'
    end
  end

  private
  def load_job_post
    @job_post = JobPost.find(params[:id])
  end

  def job_post_params
    params.require(:job_post).permit(:title, :description, :how_to_apply, :company, :due_date, :tag_list, :category_id, :job_type_id, :city, :country)
  end
end
