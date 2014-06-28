class Car

	def get_info
		puts("I'm a car! I have driven #{@distance} miles and have #{@fuel} gallons of gas left")
	end

	def initialize
		@distance = 0
		@fuel = 10
		puts "the initialize method is running automatically"
	end

	def drive(miles)
		if (@fuel > 0 && (@fuel - (miles/20.0)) >= 0)
			@distance = @distance + miles
			@fuel = @fuel - (miles/20.0)
		else
			puts "Not enough gas to drive that distance! You need to fuel up for that to happen!"
		end
	end

	def fuel_up
		if (@fuel == 10)
			puts "The tank is already full!"
		else
			gallonsNeeded = 10 - @fuel
			@fuel = @fuel + gallonsNeeded
			cost = gallonsNeeded * 3.50
			puts "The tank has been filled and the cost of filling up is $#{cost}"
		end
	end

end
