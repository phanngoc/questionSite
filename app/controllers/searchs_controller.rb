class SearchsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
  def index
    @users = search_user
    render json: {status: Settings.status.ok, data: @users}
  end

  private

  def search_user
    results = User.ransack(name_cont: params[:q])
      .result.limit(10)
      .decorate.collect{|c| c.for_json}
    return results
  end
end
