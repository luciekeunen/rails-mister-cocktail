# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

parsed_file = JSON.parse(open(url).read)

parsed_file["drinks"].each do |hash|
 Ingredient.create!(name: hash["strIngredient1"])
end

url_photo = "http://static1.villaschweppes.com/articles/1/40/21/@/13236-le-cocktail-cardinal-article_top-2.jpg"

10.times do
  cocktail = Cocktail.create!(name: Faker::Coffee.unique.blend_name, remote_photo_url: url_photo)

  2.times do
    dose = Dose.new(description: Faker::Measurement.unique.metric_volume)
    dose.cocktail_id = cocktail.id
    dose.ingredient_id = (1..50).to_a.sample
    dose.save!
  end
end

sugar = Ingredient.find_by(name: "Sugar")
sugar.remote_photo_url = 'http://16411-presscdn-0-65.pagely.netdna-cdn.com/wp-content/uploads/2017/01/sugar-on-black-web.jpg'
sugar.save!

ice = Ingredient.find_by(name: "Ice")
ice.remote_photo_url = 'http://www.thewitnesswithin.com/wp-content/files_flutter/1284165005ice_cubes5.jpg'
ice.save!

carbonated_water = Ingredient.find_by(name: "Carbonated water")
carbonated_water.remote_photo_url = 'https://ak7.picdn.net/shutterstock/videos/8327647/thumb/1.jpg'
carbonated_water.save!

amaretto = Ingredient.find_by(name: "Amaretto")
amaretto.remote_photo_url = 'http://www.totalwine.com/media/sys_master/twmmedia/h9e/hdc/9292790759454.png'
amaretto.save!

# sugar = Ingredient.find_by(name: "Sugar")
# sugar.remote_photo_url = 'http://16411-presscdn-0-65.pagely.netdna-cdn.com/wp-content/uploads/2017/01/sugar-on-black-web.jpg'
# sugar.save!
