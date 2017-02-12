require 'rails_helper'

RSpec.describe Question, type: :model do
  it "create model successfully" do
    dataQuestion = {title: "sadasdad", content: "dewfewfwef", user_id: 11,
      up_vote: 11, down_vote: 12, views: 22}

    question = Question.create!(dataQuestion)

    expect(question).to be_present
  end

  it "create model max 255 character" do
    ex_title = ('a'..'z').to_a.shuffle[0,255].join
    dataQuestion = {title: ex_title, content: "dewfewfwef", user_id: 11,
      up_vote: 11, down_vote: 12, views: 22}

    question = Question.create(dataQuestion)
    puts question

    expect(question).to raise_error
  end
end
