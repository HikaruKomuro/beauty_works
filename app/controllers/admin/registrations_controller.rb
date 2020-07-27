class Admin::RegistrationsController < ApplicationController
  
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(admin_params)
    @admin.post_code = params[:post_code]
    @admin.address_prefecture = params[:address_prefecture]
    @admin.address_city = params[:address_city]
    @admin.address_branch = params[:address_branch]
    if @admin.save
      remember(@admin)
      flash[:success] = "#{@admin.name}を管理者として登録しました"
      redirect_to admin_url(@admin)
    else
      flash.now[:danger] = "登録できませんでした"
      render :new
    end
  end
  
  def index
  end
  
  def edit
  end
  
  def update
    if @admin.update(admin_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to admin_url(@admin)
    else
      flash[:danger] = "プロフィールを更新できませんでした"
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
  end
  
  private
  
    def set_admin
      @admin = Admin.find(params[:id])
    end
  
    def admin_params
      params.require(:admin).permit(:name, :email, :line_id, :password, :password_confirmation, :postcode, :prefecture_name, :address_city, :address_street, :address_building)
    end
    
    def address_params
      params.permit(:post_code, :address_prefecture, :address_city, :address_branch)
    end
end
