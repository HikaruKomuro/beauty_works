class Admin::SessionsController < ApplicationController
  include Admin::SessionsHelper
  
  before_action :set_admin, only: [:edit, :destroy]
  
  def new
    
  end
  
  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      remember admin
      redirect_to admin_url(admin)
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
    log_out
    flash[:danger] = "ログアウトしました"
    redirect_to new_admin_session_url
  end
  
  
end