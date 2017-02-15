class Comment < ApplicationRecord

  include PublicActivity::Model
  
  before_create :initial_value
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  
  has_many :actions, :as => :actionable

  validates :content, presence: true, length: {maximum: 255, minimum: 6}
  validates :commentable_type, presence: true
  validates :commentable_id, presence: true
  validates :user_id, presence: true

  enum comment_type: {answer: "Answer", question: "Question"} 

  def final_question
    if self.commentable_type == Comment.comment_types[:question]
      return Question.find self.commentable_id
    elsif self.commentable_type == Comment.comment_types[:answer]
      return Answer.find(self.commentable_id).question
    end
  end

  private

  def initial_value
  	self.up_vote = 0;
  	self.down_vote = 0;
  end

end
