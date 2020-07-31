class Freelances::RegistrationsController < ApplicationController
	
	before_action :set_freelance, only: [:show, :edit, :update, :destroy]
	
	def new
		@freelance = Freelance.new
	end
	
	def create
    @freelance = Freelance.new(freelance_params)
    @freelance.post_code = params[:post_code]
    @freelance.address_prefecture = params[:address_prefecture]
    @freelance.address_city = params[:address_city]
    @freelance.address_branch = params[:address_branch]
    if @freelance.save
      remember_freelance @freelance
      flash[:success] = "#{@freelance.name}を登録しました"
      redirect_to freelances_registration_url(@freelance)
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
    if @freelance.update(freelance_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to freelance_url(@freelance)
    else
      flash[:danger] = "プロフィールを更新できませんでした"
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
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
  
    def set_freelance
      @freelance = Freelance.find(params[:id])
    end
  
    def freelance_params
      params.require(:freelance).permit(:name, :email, :line_id, :password, :password_confirmation, :post_code, :address_prefecture, :address_city, :address_branch, :address_building)
    end
   
end
