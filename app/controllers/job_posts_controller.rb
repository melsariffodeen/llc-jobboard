class JobPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
  end

  def new
    @job_post = JobPost.new
    @job_post.location = Location.new
    @categories = Category.all
    @job_types = JobType.all
  end
   
  def create
    @job_post = JobPost.new(job_post_params)

    if @job_post.save
      redirect_to @job_post
    else
      render 'new'
    end
  end

  def show
    @job_post = JobPost.find(params[:id])
    @job_application = @job_post.job_applications.new

    @hash = Gmaps4rails.build_markers(@job_post) do |job_post, marker|
      marker.lat job_post.location.latitude
      marker.lng job_post.location.longitude
    end
  end

  private
  def job_post_params
    params.require(:job_post).permit(:title, :description, :due_date, :tag_list, :category_id, :job_type_id, :location_attributes => [:city, :country])
  end
end
