class Owners::RegistrationsController < ApplicationController
	
	before_action :set_owner, only: [:show, :edit, :update, :destroy]
	
	def new
		@owner = Owner.new
	end
	
	def create
    @owner = Owner.new(owner_params)
    @owner.post_code = params[:post_code]
    @owner.address_prefecture = params[:address_prefecture]
    @owner.address_city = params[:address_city]
    @owner.address_branch = params[:address_branch]
    if @owner.save
      remember_owner @owner
      flash[:success] = "#{@owner.name}を登録しました"
      redirect_to owners_registration_url(@owner)
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
    if @owner.update(owner_params) && @owner.update(address_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to owners_registration_url(@owner)
    else
      flash[:danger] = "プロフィールを更新できませんでした"
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
    if @owner.destroy
      flash[:success] = "退会しました"
      redirect_to root_url
    else
      flash[:danger] = "退会できませんでした"
      render :show
    end
  end
  
  # ログイン済みのユーザーか確認します。
    # def logged_in_admin
    #   unless logged_in?
    #     flash[:danger] = "ログインしてください。"
    #     redirect_to login_url
    #   end
    # end
    
  # # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  #   def correct_admin
  #     redirect_to(root_url) unless current_admin?(@admin)
  #   end
  
  private
  
    def set_owner
      @owner = Owner.find(params[:id])
    end
  
    def owner_params
      params.require(:owner).permit(:name, :email, :line_id, :phone_number, :password, :password_confirmation)
    end
    
    def address_params
      params.permit(:post_code, :address_prefecture, :address_city, :address_branch, :address_building)
    end
end
