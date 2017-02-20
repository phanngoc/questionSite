class AdminController < ApplicationController
	layout "admin"
  respond_to :json, :html
  before_action :verify_admin
	authorize_resource class: false

	def verify_admin
		redirect_to root_url unless current_user.is_admin?
	end

	private
	
	def set_admin_ability
		if admin_signed_in?
			@current_ability ||= Ability.new current_admin
		end
	end
end
