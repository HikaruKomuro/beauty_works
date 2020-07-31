module Freelances::SessionsHelper
	
	def log_in(freelance)
    session[:freelance_id] = freelance.id
  end
  
  def log_out
    session.delete(:freelance_id)
    @current_freelance = nil
  end
  
  def set_freelance
    @freelance = Freelance.find(params[:id])
  end
  
end
