class Freelances::SessionsController < ApplicationController
  include Freelances::SessionsHelper
  before_action :set_freelance, only: [:edit, :destroy]
  
  def new
  end
  
  def create
    freelance = Freelance.find_by(email: params[:session][:email].downcase)
    if freelance && freelance.authenticate(params[:session][:password])
      log_in(freelance)
      remember_freelance freelance
      redirect_to freelances_registration_url(freelance)
    else
      flash.now[:danger] = "ログインできませんでした"
      render :new
    end
  end
  
  def line_create
    
  end
  
  def update
  end
  
  def destroy
    log_out if freelance_logged_in?
    flash[:danger] = "ログアウトしました"
    redirect_to new_freelance_session_url
  end
  
end
