module JobPostsHelper
  def expiry_info(job_post)
    if job_post.expires_in > 0
      "Active for another #{pluralize(job_post.expires_in, "day")}"
    else
      "Will expire today"
    end
  end
end
