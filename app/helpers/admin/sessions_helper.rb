module Admin::SessionsHelper
  
  def log_in(admin)
    session[:admin_id] = admin.id
  end
  
  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end
  
  def remember(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end
  
  def set_admin
    @admin = Admin.find(params[:id])
  end
end
