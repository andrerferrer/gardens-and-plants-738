Garden.destroy_all if Rails.env.development?

Garden.create!(
  name: "My Little Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg"
)

Garden.create!(
  name: "My Other Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg"
)

# create plants
plants_data = [
  {
    name: "Vanilla Orchid",
    photo_url: "https://static1.squarespace.com/static/596f7d5d17bffcd028cef774/5973a556c534a5ea5dcde821/5a1a643c71c10b644ba29407/1602514445664/vanilla+orchid.jpg?format=1500w",
    garden: Garden.first
  },
  {
    name: "Tillandsia Bromellia",
    photo_url: "https://vivoplantas.com.br/wp-content/uploads/2018/02/Tila.jpg",
    garden: Garden.first
  },
  {
    name: "Banana Plant",
    photo_url: "https://gardenerspath.com/wp-content/uploads/2019/12/Banana-Plant-with-Ripe-Fruit.jpg",
    garden: Garden.first
  },
  {
    name: "Pau Brasilis",
    photo_url: "https://www.oeco.org.br/wp-content/uploads/2020/12/Oeco_Pau-brasil-cassio-vasconcelos.jpeg",
    garden: Garden.first
  }
]

plants_data.each do |plant_data|
  Plant.create!(plant_data)
end

# Create tags and add them to plants
tag_names = Tag::NAMES

tag_names.each do |tag_name|
  Tag.create!(name: tag_name)
end

flower_tag = Tag.find_by(name: "Flower")
vanilla = Plant.first

plant_tag = PlantTag.new
plant_tag.tag = flower_tag
plant_tag.plant = vanilla
plant_tag.save!
