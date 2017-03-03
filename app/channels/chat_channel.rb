class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from stream_name
  end

  def self.receive(data)
    ActionCable.server.broadcast "topic_1", data
  end

  def stream_name
    "topic_#{params[:topic_id]}"
  end

  def chat_id
    params.fetch("data").fetch("topic")
  end
end