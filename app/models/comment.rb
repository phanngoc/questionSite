class Comment < ApplicationRecord
  
  before_create :initial_value
  belongs_to :targetable, polymorphic: true
  belongs_to :user
  
  

  private

  def initial_value
  	self.up_vote = 0;
  	self.down_vote = 0; 
  end

end
