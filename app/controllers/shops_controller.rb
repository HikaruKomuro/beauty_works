class ShopsController < ApplicationController
  	before_action :set_shop, only: [:show, :edit, :update, :destroy]
	
	def new
		@shop = Shop.new
	end
	
	def create
    @shop = Shop.new(shop_params)
    @shop.post_code = params[:post_code]
    @shop.address_prefecture = params[:address_prefecture]
    @shop.address_city = params[:address_city]
    @shop.address_branch = params[:address_branch]
    if @shop.save
      flash[:success] = "#{@shop.name}を登録しました"
      redirect_to shop_url(@shop)
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
    if @shop.update(shop_params) && @shop.update(address_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to shops_registration_url(@shop)
    else
      flash[:danger] = "プロフィールを更新できませんでした"
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
    if @shop.destroy
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
  
    def set_shop
      @shop = Shop.find(params[:id])
    end
  
    def shop_params
      params.require(:shop).permit(:name, :email, :line_id, :phone_number)
    end
    
    def address_params
      params.permit(:post_code, :address_prefecture, :address_city, :address_branch, :address_building)
    end
end

