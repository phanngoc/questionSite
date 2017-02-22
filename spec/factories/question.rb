def to_slug
  ret = self.strip
  ret.gsub! /['`]/,""
  ret.gsub! /\s*@\s*/, " at "
  ret.gsub! /\s*&\s*/, " and "

  ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'  
  ret.gsub! /_+/,"_"
  ret.gsub! /\A[_\.]+|[_\.]+\z/,""
  ret
end

FactoryGirl.define do
  factory :question, class: Question do
    before(:create, :build, :attributes_for) do |question|
      question.user {FactoryGirl.create(:user)}
    end

    title {Faker::Lorem.sentence}
    content {Faker::Lorem.paragraph(2, true)}
    slug {Faker::Lorem.sentence}
    user_id {2}
  end

  factory :invalid_question, class: Question do
    before(:create, :build) do |invalid_question|
      invalid_question.user {[FactoryGirl.create(:user)]}
    end

    title {""}
    content {Faker::Lorem.paragraph(2, true)}
    slug {Faker::Lorem.sentence}
    user_id {2}
  end
end