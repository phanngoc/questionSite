class Api::TopicsController < ApplicationController

  def list_user_follow
    @users = User.with_topic params[:topic_id]
    render json: @users
  end

  def push
    redis = Redis.new(host: "127.0.0.1", port: 6379)
    message = ActiveSupport::JSON.encode({ name: 'ngoc11', id: 11,
      avatar: "http://lorempixel.com/40/40/", content: "hello", time: Time.now.to_i })

    addObj = redis.zadd("topic_#{params[:topic_id]}", Time.now.to_i, message)

    messages = redis.zrange("topic_#{params[:topic_id]}", 0, -1, :with_scores => true)

    ChatChannel.receive(messages)
    render text: messages
  end

  private

end
