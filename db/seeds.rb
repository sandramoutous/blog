# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all


# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "rhum")
# Ingredient.create(name: "lemonade")


# Cocktail.create(name: "punch")
# Cocktail.create(name: "tequila sunrise")
puts "creating ingredients"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
repo = open(url).read()
ending = JSON.parse(repo)
e = ending.flatten[1]
e.each do |item|
  cocktail = Ingredient.create!(
    name: item['strIngredient1']
  )
end

puts "creating dose"


Dose.create(
  description: "6cl",
  cocktail: Cocktail.create(name: "mojito"),
  ingredient: Ingredient.create(name: "lemon")
)

Dose.create(
  description: "8cl",
  cocktail: Cocktail.create(name: "punch"),
  ingredient: Ingredient.create(name: "ananas")
)

Dose.create(
  description: "10g",
  cocktail: Cocktail.create(name: "tequila"),
  ingredient: Ingredient.create(name: "ice")
)
