class Cookbook

	def initialize(title)
		@title = title
		@recipes = []
	end

	attr_accessor :title
	attr_reader :recipes


	def add_recipe(recipe)
		@recipes.push(recipe)
		puts "Added a recipe to the collection: #{recipe.title}"
	end

	def recipe_titles
		@recipes.each do |x|
			puts "#{x.title}"
		end
	end

	def recipe_ingredients
		@recipes.each do |x|
			puts "These are the ingredients for #{x.title} #{x.ingredients}"
		end
	end

	def print_cookbook
		puts "Printing recipes in the #{@title} cookbook"
		@recipes.each do |x|
			x.print_recipe
		end
	end

	def count_recipes
		count = 0
		@recipes.each do |x|
			count=count.next
		end
		puts "This cookbook has #{count} recipes in it"
	end

	def count_all_steps
		count=0
		@recipes.each do |x|
			x.steps.each do |x|
				count = count.next
			end
		end
		puts "This cookbook's recipes contain a total of #{count} steps. Nobody got time for that!"
	end

end

class Recipe

	def initialize(title, ingredients, steps)
		@title = title
		@ingredients = ingredients
		@steps = steps
	end

	attr_accessor :title
	attr_accessor :ingredients
	attr_accessor :steps

	def print_recipe
		puts @title + " ingredients include:"
		
		num=0
		@ingredients.each do |x|
			p num.next.to_s + ". " + x
			num=num.next
		end

		num=0
		puts @title + " steps include:"
		@steps.each do |x|
			p num.next.to_s + ". " + x
			num=num.next
		end
	end

end