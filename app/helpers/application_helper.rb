module ApplicationHelper
	
  def full_title(page_name = "")
    base_title = "Beauty_works"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
  def admin_logged_in?
    !current_admin.nil?
  end
  
  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  end
  
end
