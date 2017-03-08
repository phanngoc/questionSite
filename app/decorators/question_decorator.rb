class QuestionDecorator < Draper::Decorator
  delegate_all

  attr_accessor :flag_up, :flag_down

  def initialize(object)
    super(object)
    @flag_up = is_up
    @flag_down = is_down
  end

  def is_up
    Action.is_upvote_question(h.current_user.id, self.id).empty? ? 0 : 1;
  end

  def is_down
    Action.is_downvote_question(h.current_user.id, self.id).empty? ? 0 : 1;
  end
end
