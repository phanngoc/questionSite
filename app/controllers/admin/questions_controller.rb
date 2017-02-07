class Admin::QuestionsController < AdminController

  def index
    @questions = Question.includes([:user, :topics]).all
  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy
    result = Question.destroy params[:id]

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
