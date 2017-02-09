class Admin::TopicsController < AdminController

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find params[:id]
  end

  def update
    @topic = Topic.find_by slug: params[:id]
    if @topic.update_attributes topic_params
      flash[:success] = t "flash.admin.topic.update.success"
      redirect_to admin_topics_path
    else
      flash[:danger] = t "flash.admin.topic.update.failed"
      render :edit
    end
  end

  def destroy
    result = Topic.destroy params[:id]
    if result.nil?
      flash[:danger] = t "flash.admin.topic.delete.failed"
      redirect_to(:back)
    else
      flash[:success] = t "flash.admin.topic.delete.success"
      redirect_to admin_topics_path
    end
  end

  def create
    @topic = Topic.new topic_params

    if @topic.save
      redirect_to admin_topics_path
    else
      redirect_to(:back)
    end
  end

  def topic_params
    params.require(:topic).permit(:icon, :name, :description)
  end
end
