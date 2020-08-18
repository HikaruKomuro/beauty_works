module Owners::SessionsHelper
	def log_in(owner)
    session[:owner_id] = owner.id
  end
  
  def log_out
    session.delete(:owner_id)
    @current_owner = nil
  end
  
  def set_owner
    @owner = Owner.find(params[:id])
  end
end
