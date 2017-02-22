FactoryGirl.define  do
  factory :topic, class: Topic do
    name {Faker::Name.name}
    icon {Faker::LoremPixel.image("50x60")}
    slug {Faker::Name.name}
  end

  factory :invalid_topic, class: Topic do
    name {""}
    icon {Faker::LoremPixel.image("50x60")}
    slug {Faker::Name.name}
  end
end