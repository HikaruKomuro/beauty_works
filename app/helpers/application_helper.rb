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
  
  def freelance_logged_in?
    !current_freelance.nil?
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
  
  def current_freelance
    if (freelance_id = session[:freelance_id])
      @current_freelance ||= Freelance.find_by(id: freelance_id)
    elsif (freelance_id = cookies.signed[:freelance_id])
    	freelance = Freelance.find_by(id: freelance_id)
    	if freelance && freelance.authenticated?(cookies[:remember_token])
    		log_in freelance
    		@current_freelance = freelance
    	end
    end
  end
  
  def remember_admin(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end
  
  def remember_freelance(freelance)
    freelance.remember
    cookies.permanent.signed[:freelance_id] = freelance.id
    cookies.permanent[:remember_token] = freelance.remember_token
  end
  
  
  
end
