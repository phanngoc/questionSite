class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def verify_admin_mod
    redirect_to root_url unless current_user.admin? || current_user.moderator?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
