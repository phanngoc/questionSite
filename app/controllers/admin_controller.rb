class AdminController < ApplicationController
	layout "admin"
  	respond_to :json, :html	
  	
	private
		def set_admin_ability
		if admin_signed_in?
		  @current_ability ||= Ability.new current_admin
		end
	end
end
