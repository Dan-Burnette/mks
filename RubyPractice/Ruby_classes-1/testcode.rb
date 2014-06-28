require_relative 'cookbook'

mex_cuisine = Cookbook.new("Mexican Cooking")
burrito = Recipe.new("Bean Burrito", ["tortilla", "bean"], ["heat beans", "place beans in tortilla", "roll up"])
mexicanpizza = Recipe.new("mexican pizza", ["dough", "cheese", "toppings", "beans"], ["knead dough", "add cheese", "add toppings","add beans", "place in oven"])

puts mex_cuisine.title # Mexican Cooking
puts burrito.title # Bean Burrito
puts mexicanpizza.title #Pizza

p burrito.ingredients # ["tortilla", "bean", "cheese"]
p burrito.steps # ["heat beans", "heat tortilla", "place beans in tortilla", "sprinkle cheese on top", "roll up"]
p mexicanpizza.ingredients # ["dough", "cheese", "toppings", "beans"]
p mexicanpizza.steps # ["knead dough", "add cheese", "add toppings","add beans", "place in oven"]

mex_cuisine.title = "Mexican Recipes"
puts mex_cuisine.title # Mexican Recipes

burrito.title = "Veggie Burrito"
burrito.ingredients = ["tortilla", "tomatoes"]
burrito.steps = ["heat tomatoes", "place tomatoes in tortilla", "roll up"]

p burrito.title # "Veggie Burrito"
p burrito.ingredients # ["tortilla", "tomatoes"]


mex_cuisine.recipes # []
mex_cuisine.add_recipe(burrito)
mex_cuisine.add_recipe(mexicanpizza)
p mex_cuisine.recipes # [#<Recipe:0x007fbc3b92e560 @title="Veggie Burrito", @ingredients=["tortilla", "tomatoes"], @steps=["heat tomatoes", "place tomatoes in tortilla", "roll up"]>]

mex_cuisine.recipe_titles # Veggie Burrito
mex_cuisine.recipe_ingredients # These are the ingredients for Veggie Burrito: ["tortilla", "bean"]

burrito.print_recipe
mexicanpizza.print_recipe

mex_cuisine.print_cookbook
mex_cuisine.count_recipes
mex_cuisine.count_all_steps