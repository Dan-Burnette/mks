class Airplane
	@@city_to_airplane = {}

	attr_writer :city
	attr_reader :capacity

	def initialize(city, capacity)

		if (is_taken(city) == false)
			@city = city
			@capacity = capacity
			@@city_to_airplane.store(@city, @capacity)
		else
			puts "That city is taken! Pick another one!"
		end

	end

	#helper method... keeping it DRY!
	def is_taken(city)

		@@city_to_airplane.each do |k,v|
			if (k == city)
				return true
			end
		end

		false
	end

	def fly_to_city(city)

		if (is_taken(city) == false)
			@@city_to_airplane.delete(@city)
			@@city_to_airplane.store(city, @capacity)
			@city = city;
			puts "The plane is flying to #{@city}"
		else
			puts "Error, that city is taken!"
		end

	end

	def can_i_fly(city1, city2)

		if (is_taken(city1) == true && is_taken(city2) == false)
			puts "The airplane in #{city1} can fly you to #{city2}"
		else
			nil
		end

	end

end