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


10.times do
  cocktail = Cocktail.create!(name: Faker::Coffee.unique.blend_name)

  3.times do
    dose = Dose.new(description: Faker::Measurement.unique.metric_volume)
    dose.cocktail_id = cocktail.id
    dose.ingredient_id = (1..50).to_a.sample
    dose.save!
  end
end
