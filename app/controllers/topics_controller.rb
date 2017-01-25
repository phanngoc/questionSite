class TopicsController < ApplicationController
  layout "main"

  def index
    debugger
  end

  def new
    @encrypted_password = ::BCrypt::Password.create("123456").to_s
    debugger
    @topic = Topic.new
  end

  def create
    @topic = Topic.new topic_params

    # like this
    if @topic.save

    else

    end
  end

  def show
    @topic = Topic.find(params[:id])
  end


  def topic_params
    params.require(:topic).permit(:icon, :name, :description)
  end
end
