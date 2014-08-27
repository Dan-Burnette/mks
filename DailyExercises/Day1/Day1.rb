
#Data structure modeling 1
#2
{fav_book: "Gourd of the Flies", author: "J.W. Gourding"}


class Book

	def initialize(name, author)
		@name = name
		@author = author
	end

end

#3
books = 
	[
	{name: "Design Patterns", authors: ["John Vlissides", "Richard Helm", "Ralph Johnson", "Erich Gamma"]},
	{name: "Patterns of Enterprise Application Architecture", authors: ["Martin Fowler"] },
	{name: "Domain Driven Design", authors: ["Eric Evans"]}
	]

#4
volunteer_applicant = {name: "Alice", age: 25, phone: "555-555-5555", position: "event receptionist"  }

#5
computer = 
{model: "MacBook Air",
 manufacturer: "Apple",
 gigs_storage: 256, 
 harddrive_type: "SSD",
 gigs_ram: 8,
 display: "retina",
 processor: "i7",
 processor_manufacturer: "Intel",
 preloaded_software: ["iPhoto", "iMovie","iMessage"]
}

#6
dogs =
[
	{name: "Maple", age: 4, type: "pitbull", description: "brown", fav_game: "tug-o-war", loves: "swimming in the lake"},
  {name: "Atlas", age: 3, type: "boxer", description: "super energetic", fav_game: "fetch", loves: "swimming in the lake"}
]

#7
restaurant = 
{
  name: "Patrick's Pizza Palace",
  address: "716 Congress",
  health_score: 100,
  appetizers: ["mozarella sticks", "calzone", "garlic knots"],
  entrees: ["chicken parmigiana", "slice of pizza", "spaghetti & eggplant"],
  deserts: ["tiramisu", "canoli", "cheesecake"]
}

#8
class Restaurant

  attr_reader :name, :address, :health_score, :menu

  def initialize(args)
    @name = args.fetch(:name, "no name")
    @address = args.fetch(:address, "no address")
    @health_score = args.fetch(:health_score, "no health score")
    @menu = {
      appetizers: args.fetch(:appetizers, []),
      entrees: args.fetch(:entrees, []),
      deserts: args.fetch(:deserts, [])
    }
  end

end

#Data Structure Modeling 2

#2
#amounts in respective quantities (0 if indeterminant amount)
recipes =
[
  {name: "apple salad", serves: 4, ingredients: {oz_mixed_greens: 6, tbs_honey_mustard: 1, tbs_almonds: 2, apples: 4, salt_pepper: 0} },
  {name: "bean burgers", serves: 4, ingredients: {black_beans: 2, buns: 4, lettuce: 0, thinly_sliced_tomatoes: 8, cups_feta_cheese: 1, mustard: 0} },
  {name: "avocado soup", serves: 2 , ingredients: {avocado: 1, soup: 1, cookies: 0} }
]

recipes[0][:ingredients].sort_by { |key, value| value}



