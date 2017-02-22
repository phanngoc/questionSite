FactoryGirl.define  do
  factory :user, class: User do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    avatar {Faker::LoremPixel.image("50x60")}
    story {Faker::Lorem.sentence}
    role {1}
    slug {Faker::Name.name}
  end

  factory :invalid_user, class: User do
    name {""}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    avatar {Faker::LoremPixel.image("50x60")}
    story {Faker::Lorem.sentence}
    role {1}
    slug {Faker::Name.name}
  end
end