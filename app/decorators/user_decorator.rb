class UserDecorator < Draper::Decorator
  delegate_all

  def for_json
    {
      id: self.id,
      name: self.name,
      avatar: self.avatar,
      isAdded: self.isAdded
    }
  end

  def isAdded
    Action.is_request(h.current_user.id, self.id, context[:question_id]).empty? ? 0 : 1;
  end
end
