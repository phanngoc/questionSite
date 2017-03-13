class NotiChannel < ApplicationCable::Channel
  def subscribed
    stream_from self.stream_name
  end

  def stream_name
    "noti_user_#{current_user.id}"
  end
end
