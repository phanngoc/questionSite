require "rails_helper"

describe "check homepage when login" do
  let(:user) {FactoryGirl.create :user}

  context "go to home page" do
    it "check already login" do
      visit "/users/sign_in"
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on "Log in"

      expect(page).to have_content "Account"
    end
  end
end