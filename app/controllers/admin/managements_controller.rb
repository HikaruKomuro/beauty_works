class Admin::ManagementsController < ApplicationController
	before_action
	def show
		@admin = Admin.find(params[:id])
	end
end
