class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	def verify_admin_mod
		redirect_to root_url unless current_user.is_admin? || current_user.is_moderator?
	end

	def not_found
		raise ActionController::RoutingError.new('Not Found')
	end
end
