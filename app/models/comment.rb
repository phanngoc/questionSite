class Comment < ApplicationRecord

  before_create :initial_value
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  has_many :actions, :as => :actionable

  def final_question
    if self.commentable_type == "Question"
      return Question.find self.commentable_id
    elsif self.commentable_type == "Answer"
      return Answer.find(self.commentable_id).question
    end

  end

  private

  def initial_value
  	self.up_vote = 0;
  	self.down_vote = 0;
  end

end
