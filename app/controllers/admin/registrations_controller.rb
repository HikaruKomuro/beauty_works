class Admin::RegistrationsController < ApplicationController
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      # remember
      flash[:success] = "#{@admin.name}を管理者として登録しました"
      redirect_to admin_registration_url(@admin)
    else
      render :new
    end
  end
  def index
  end
  def edit
  end
  def update
  end
  def show
  end
  def destroy
  end
  private
    def admin_params
      params.require(:admin).permit(:name, :email, :line_id, :password, :password_confirmation)
    end
end
