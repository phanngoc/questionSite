class HomeController < ApplicationController
  layout "main"
  def index
    puts destroy_user_session_path
  end
end
