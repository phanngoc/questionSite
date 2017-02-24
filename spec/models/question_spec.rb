require "rails_helper"

describe Question, type: :model do

  context "associations" do
    let(:question) {FactoryGirl.create :question}
    subject {question}
    it {should belong_to :user}
    it {expect have_many :question_topics}
    it {expect have_many :version_questions}
  end

  context "validation presence" do
    let!(:question) {FactoryGirl.build :question}
    subject {question}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:content)}
    it {should validate_uniqueness_of(:slug)}
    
  end

  context "valid question save unvalid" do
    let(:invalid_question) {FactoryGirl.build :invalid_question}
    let(:question) {FactoryGirl.create :question}

    subject {invalid_question}

    it "is not valid, without a title" do
      question.title = ""
      expect(question).to_not be_valid
    end

    it "is not valid, without a content" do
      question.content = ""
      expect(question).to_not be_valid
    end

    it "is not valid when have over 255 character" do
      question.content = (0...257).map {('a'..'z').to_a[rand(26)]}.join
      expect(question).to_not be_valid
    end
    
  end

  context "valid object save" do
    let(:question) {FactoryGirl.build :question}
    subject {question}
    it {expect(question).to be_valid}
  end
end