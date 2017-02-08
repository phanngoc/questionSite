class TopicsController < ApplicationController
  layout "main"

  def index
  end

  def new
    @topic = Topic.new
  end

  def create

  end

  def show
    @topic = Topic.includes({:questions => [:topics, :user, :answers => [:user, {:comments => [:actions, :user]}]]}).find(params[:id])
    @questions = @topic.questions.paginate(:page => params[:page], :per_page => 2)

    @countQuestion = @topic.questions.count
    @numberPeopleFollow = Topic.numberFollow @topic.id
    @numberAnswerInTopic = Topic.numberAnwserInTopic @topic.id
  end

end
