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
    if (admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: admin_id)
    elsif (admin_id = cookies.signed[:admin_id])
    	admin = Admin.find_by(id: admin_id)
    	if admin && admin.authenticated?(cookies[:remember_token])
    		log_in admin
    		@current_admin = admin
    	end
    end
  end
  
end
