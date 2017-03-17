class AnswerDecorator < Draper::Decorator
  delegate_all

  def for_json
    {
      id: self.id,
      content: self.instead_version_content,
      is_up: self.is_up,
      is_down: self.is_down,
      user_id: self.user_id,
      reply_to: self.reply_to
    }
  end

  def instead_version_content
    newestObj = Veran.find_newest(self.id);
    if newestObj
      return newestObj.content
    else
      return self.content
    end
  end

  def is_up
    Action.is_upvote_answer(h.current_user.id, self.id).empty? ? 0 : 1;
  end

  def is_down
    Action.is_downvote_answer(h.current_user.id, self.id).empty? ? 0 : 1;
  end

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
