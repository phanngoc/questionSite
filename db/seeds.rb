# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  name = Faker::Name.name
  User.create :name => name,
              :email => Faker::Internet.email,
              :password => "123456",
              :avatar => Faker::Avatar.image(name + '-avatar', "50x50", "jpg")
end

path = Rails.root.join("public", "uploads", "general", "no-image-icon-13.png").to_s
puts path

topic_list = [
  [ "Scientic", "Day la chuyen muc scientic", "no-image-icon-13.png"],
  [ "E commerce", "Day la chuyen muc e commerce", "no-image-icon-13.png"],
  [ "Trending", "Day la chuyen muc trending", "no-image-icon-13.png"],
  [ "Architect", "Day la chuyen muc architect", "no-image-icon-13.png"]
]



topic_list.each do |name, description, icon|
	topic = Topic.new
	topic.name = name
	topic.description = description
	File.open(path) do |f|
	  topic.icon = f
	end

	topic.save!
  # Topic.create :name => name, :description => description, :icon => icon
end

