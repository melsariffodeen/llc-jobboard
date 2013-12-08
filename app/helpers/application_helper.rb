module ApplicationHelper
  def admin_area?
    request.fullpath.split('/')[1] == 'admin' && admin_signed_in?
  end
end
