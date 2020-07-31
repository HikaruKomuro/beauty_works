class Admin::SessionsController < ApplicationController
  include Admin::SessionsHelper
  
  before_action :set_admin, only: [:edit, :destroy]
  
  def new
    @admin = Admin.new
  end
  
  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      remember_admin admin
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
    log_out if logged_in?
    flash[:danger] = "ログアウトしました"
    redirect_to new_admin_session_url
  end
  
end