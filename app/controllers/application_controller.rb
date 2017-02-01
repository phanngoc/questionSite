class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

  	private

	def load_user
		@user = current_user
	end
end
