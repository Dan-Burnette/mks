 #Parsing a text file (recipes.txt) into ingredient and Recipe Objects

class Recipe
  attr_reader :name, :servings, :ingredients
   
  def initialize(name, servings)
    @name = name
    @servings = servings
    @ingredients = []
  end
   
  def add_ingredient(i)
  @ingredients << i
  end
 
end
 
class Ingredient
  attr_reader :name, :quantity, :units
   
  def initialize(name, quantity=:to_taste, units=nil)
    @name = name
    @quantity = quantity
    @units = units
  end
end

#Part 1 : Parsing the text file into hashes
raw = File.read('recipes.txt')
step1 = raw.split("\n\n")
step2 = step1.map { |x| x.split("\n") }
recipes = []
step2.map do |rec|
  hsh = 
  {
    name: rec.first,
    serves: rec[1].split.last.to_i,
    ingredients: rec[2..-1]
  }

  #put all the recipes into an array for further processing in step 2
  recipes.push(hsh)
end

#Part 2: Parsing the hashes into Recipe Objects w. ingredients objects inside
recipe_object_array = []

recipes.each do |rec|
  current_recipe = Recipe.new(rec[:name], rec[:serves])
  ingredients = rec[:ingredients]

  #Process each item in ingredients into ingredient objects and add them to the recipe object
  ingredients.each do |ing|

    # to check for quantity and units
    split = ing.split()

    #to_i on letters == 0 
    quantity = split[0].to_i
    units = split[1]
    acceptable_units = ["oz", "tbs", "lbs", "cup"]

    #if it has a quantity and units
    if (quantity != 0 && acceptable_units.include?(units))
      name = split[2..-1].join(" ")
      current_recipe.add_ingredient( Ingredient.new(name, quantity, units) )

    #elsif it has a quantity but no units ("4 apples")
    elsif (quantity != 0 && acceptable_units.include?(units) == false)
      name = split[1..-1].join(" ")
      current_recipe.add_ingredient( Ingredient.new(name, quantity) )
    #else it has no quantity or units
    else
      name = ing
      current_recipe.add_ingredient( Ingredient.new(name) )
    end

  end

  recipe_object_array.push(current_recipe)

end
puts recipe_object_array

#Testcode
recipe_object_array[0].name # => apple salad
recipe_object_array[0].servings 
recipe_object_array[0].ingredients 

recipe_object_array[1].name # => bean burgers
recipe_object_array[1].servings
recipe_object_array[1].ingredients

recipe_object_array[2].name # => avocado soup
recipe_object_array[2].servings
recipe_object_array[2].ingredients