require "rails_helper"

describe VotesController do

  let(:user) {FactoryGirl.create :user}
  let(:answer) {FactoryGirl.create :answer}

  before :each do
    @user = FactoryGirl.create :user
    sign_in @user
  end

  describe "PUT update" do
    context "vote up for answer" do
      before {post :update, {_method: :put,
        answer_id: answer.id,
        id: 1
      }}
      it {should permit(:actionable_id, :actionable_type, :user_id, :type_act)
        .for(:update, params: params)}
      it {is_expected.to respond_with_content_type :json}
    end
  end
end