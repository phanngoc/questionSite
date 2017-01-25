class TopicsController < ApplicationController
  layout "main"

  def index
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new topic_params

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
