class Owners::SessionsController < ApplicationController
	include Owners::SessionsHelper
  before_action :set_owner, only: [:edit, :destroy]
  
  def new
  end
  
  def create
    owner = Owner.find_by(email: params[:session][:email].downcase)
    if owner && owner.authenticate(params[:session][:password])
      log_in(owner)
      remember_owner owner
      redirect_to owners_registration_url(owner)
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
    log_out if owner_logged_in?
    flash[:danger] = "ログアウトしました"
    redirect_to root_url
  end
  
end
