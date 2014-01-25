class JobApplicationsController < ApplicationController
  def create
    job_post = JobPost.find(params[:job_application][:job_post_id])
    @job_application = job_post.job_applications.new(job_application_params)

    if @job_application.save
      redirect_to job_post
    else
      render job_post
    end
  end

  private
  def job_application_params
    params.require(:job_application).permit(:applicant_first_name, :applicant_last_name, :applicant_email, :cover_letter, :resume)
  end
end
