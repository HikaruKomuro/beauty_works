module Admin::SessionsHelper
  
  def log_in(admin)
    session[:admin_id] = admin.id
  end
  
  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end
  
  def set_admin
    @admin = Admin.find(params[:id])
  end
  
end
