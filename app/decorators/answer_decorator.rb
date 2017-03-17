class AnswerDecorator < Draper::Decorator
  delegate_all

  attr_accessor :is_edited

  def for_json
    {
      id: self.id,
      content: self.instead_version_content,
      is_up: self.is_up,
      is_down: self.is_down,
      user_id: self.user_id,
      reply_to: self.reply_to,
      is_edited: self.is_edited
    }
  end

  def instead_version_content
    newestObj = Veran.find_newest(self.id);
    if newestObj
      self.is_edited = true;
      return newestObj.content
    else
      self.is_edited = false;
      return self.content
    end
  end

  def is_up
    (h.current_user && Action.is_upvote_answer(h.current_user.id, self.id).empty?) ? 0 : 1;
  end

  def is_down
    (h.current_user && Action.is_downvote_answer(h.current_user.id, self.id).empty?) ? 0 : 1;
  end

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
