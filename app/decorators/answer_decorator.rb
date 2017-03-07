class AnswerDecorator < Draper::Decorator
  delegate_all

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
