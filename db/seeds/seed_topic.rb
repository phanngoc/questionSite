topic_list = [
  [ "Scientic", "Day la chuyen muc scientic", "no-image-icon-13.png"],
  [ "E commerce", "Day la chuyen muc e commerce", "no-image-icon-13.png"],
  [ "Trending", "Day la chuyen muc trending", "no-image-icon-13.png"],
  [ "Architect", "Day la chuyen muc architect", "no-image-icon-13.png"]
]

topic_list.each do |name, description, icon|
  Topic.create( name: name, description: description, icon: icon )
end
