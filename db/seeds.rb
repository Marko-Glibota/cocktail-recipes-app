# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

all_ingredients = []

ingredients["drinks"].each_with_index do |ingredient, index|
  new_ingredient = Ingredient.new(
    name: ingredients["drinks"][index]["strIngredient1"]
    )
  new_ingredient.save!
  all_ingredients << new_ingredient
  puts "#{new_ingredient.name} successfully created"
end

puts "Finished creating 100 ingredients"

cocktail = Cocktail.new(name: "Mojito")
cocktail.save!
puts "Mojito created"

dose = Dose.new(
  description: "2 cl",
  cocktail: cocktail,
  ingredient: all_ingredients.sample
  )

dose.save!
puts "One dose created"


