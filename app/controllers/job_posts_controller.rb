class JobPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_job_post, only: [:show, :charge]

  def index
    @categories = Category.all
    @job_types = JobType.all


    if params[:tag]
      @job_posts = JobPost.tagged_with(params[:tag])
    elsif params[:category] || params[:job_type]
      @job_posts = JobPost.active
      @job_posts = @job_posts.by_category(params[:category]) if params[:category].present?
      @job_posts = @job_posts.by_job_type(params[:job_type]) if params[:job_type].present?
    else
      @job_posts = JobPost.active
    end

    @job_posts = @job_posts.paginate(page: params[:page])
  end

  def user_posts
    @job_posts = current_user.job_posts.reverse
  end

  def new
    @job_post = JobPost.new
    @categories = Category.all
    @job_types = JobType.all
  end

  def create
    @job_post = current_user.job_posts.new(job_post_params)
    @categories = Category.all
    @job_types = JobType.all

    if @job_post.save
      redirect_to @job_post
    else
      render 'new'
    end
  end

  def show
    @job_application = @job_post.job_applications.new
    raise ActionController::RoutingError.new('Not Found') if !@job_post.active? && @job_post.user.id != current_user.try(:id)
  end

  def charge
    @job_post.charge(params[:stripeToken], params[:stripeEmail])

    redirect_to @job_post, :notice => "Thank you for your payment!"
  rescue => e
    redirect_to @job_post, :alert => e.message
  end

  private
  def job_post_params
    params.require(:job_post).permit(:title, :description, :company, :due_date, :tag_list, :category_id, :job_type_id, :city, :country)
  end

  def token_params
    params.require(:token).permit(:id, :name)
  end

  def set_job_post
    @job_post = JobPost.find(params[:id])
  end
end
