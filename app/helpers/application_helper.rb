module ApplicationHelper
  def admin_area?
    request.fullpath.split('/')[1] == 'admin' && admin_signed_in?
  end

  def job_posts?
    current_page?(root_path) || current_page?(controller: 'job_posts', action: 'index')
  end

  def content_col_class
    if admin_area?
        'col-sm-12'
    else
        'col-sm-9'
    end
  end
end
