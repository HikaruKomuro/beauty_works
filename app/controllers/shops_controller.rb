class ShopsController < ApplicationController
  	before_action :set_shop, only: [:show, :edit, :update, :destroy]
  	before_action :set_length, only: [:new, :create]
	
	def new
		@shop = Shop.new
		@week = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]
		@occupations = Occupation.all
		@options = Option.where(standard: true)
		@options_facility = @options.where(salon_facility: true)
    @options_practitioner = @options.where(for_practitioner: true)
    @options_guest = @options.where(for_guest: true)
	end
	
	def create
    @shop = Shop.new(shop_params)
    @shop.owner_id = 1
    # 住所保存
    @shop.post_code = params[:post_code]
    @shop.address_prefecture = params[:address_prefecture]
    @shop.address_city = params[:address_city]
    @shop.address_town = params[:address_town]
    @shop.address_building = params[:address_building]
    @occupations = Occupation.all
    @options = Option.where(standard: true)
    @options_facility = @options.where(salon_facility: true)
    @options_practitioner = @options.where(for_practitioner: true)
    @options_guest = @options.where(for_guest: true)
    if @shop.save
      # 職種の中間テーブル保存
      @occupations.each do |oc|
        if params[:shop][:occupation][:"#{ oc.name }"] == "1"
          @shop_occupations = ShopOccupation.create(shop_id: @shop.id, occupation_id: oc.id)
        end
      end
      # 追加定休日の保存
      @holiday.shop_id = @shop.id
      @holiday.save
      # 料金の保存
      @length.each_with_index do |length, index|
        @fee = @shop.fees.new(plan: params[:shop]["plan#{index}"], pay: params[:shop]["pay#{index}"], apply: params[:shop]["apply#{index}"])
        @fee.save
      end
      # オプション保存
      @options_facility.each_with_index do |of, index|
        if params[:shop]["facility#{ index }"] == "1"
          ShopOption.create(shop_id: @shop.id, option_id: of.id)
        end
      end
      @options.pluck(:specific).uniq.compact.each do |specific|
        @options_practitioner.where(specific: specific).each_with_index do |op, index|
          if params[:shop]["p_#{specific}_#{index}"] == "1"
            ShopOption.create(shop_id: @shop.id, option_id: op.id)
          end
        end
        
        @options_guest.where(specific: specific).each_with_index do |og, index|
          if params[:shop]["g_#{specific}_#{index}"] == "1"
            ShopOption.create(shop_id: @shop.id, option_id: og.id)
          end
        end
      end
      @options_practitioner.where(specific: nil).each_with_index do |op, index|
        if params[:shop]["p_common_#{index}"] == "1"
          ShopOption.create(shop_id: @shop.id, option_id: op.id)
        end
      end
      @options_guest.where(specific: nil).each_with_index do |og, index|
        if params[:shop]["g_common_#{index}"] == "1"
          ShopOption.create(shop_id: @shop.id, option_id: og.id)
        end
      end
      5.times do |index|
        if params[:shop]["paid#{index}"].present? && params[:shop]["pay#{ index }"].present?
          option = Option.create!(name: params[:shop]["paid#{index}"], pay: params[:shop]["pay#{ index }"], paid_option: true)
          ShopOption.create(shop_id: @shop.id, option_id: option.id)
        end
      end
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
    
    def set_length
      @length = ["３０分","４５分","６０分","９０分","１２０分","延長１５分","延長３０分","延長６０分","１日","1ヶ月",nil,nil,nil]
    end
  
    def shop_params
      params.require(:shop).permit(:name, :email, :line_id, :phone_number, :owners_id, :appeal, :memo, :introduction, :customer_sex, :worker_sex, :share,
                                    :mon_start, :tue_start, :wed_start, :thu_start, :fri_start, :sat_start, :sun_start,
                                    :mon_finish, :tue_finish, :wed_finish, :thu_finish, :fri_finish, :sat_finish, :sun_finish,
                                    :mon_off, :tue_off, :wed_off, :thu_off, :fri_off, :sat_off, :sun_off)
    end

end

