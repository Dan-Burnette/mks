#Updated to allow for multiple planes per city and more advanced functionality
class Airplane
	@@city_to_airplanes = {}
	@@airplanes_to_destinations = {}

	attr_accessor :city
	attr_reader :capacity
	attr_accessor :passengers

	def initialize(city, capacity)

		@city = city
		@capacity = capacity
		@passengers = 0

		if (@@city_to_airplanes.has_key?(city))
			plane_array = @@city_to_airplanes[city]
			plane_array.push(self)
			@@city_to_airplanes.store(city, plane_array)

		else
			@@city_to_airplanes.store(city, [self])

		end

	end


	def fly_to_city(city)
		#Take old city plane array, remove plane, re-store updated array, update @city
		planes_at_old_city = @@city_to_airplanes[@city]
		planes_at_old_city.delete(self)
		@@city_to_airplanes.store(@city, planes_at_old_city)
		@city = city;

		#Take new city plane array, remove plane, re-store updated array
		if (@@city_to_airplanes.has_key?(city))
			planes_at_new_city = @@city_to_airplanes[city]
			planes_at_new_city.push(self)
			@@city_to_airplanes.store(city, planes_at_new_city)
			
		#If the city does not yet have a plane, re-initialize the plane at the correct place
		else
			initialize(@city, @capacity)
		end

		puts "The plane is flying to #{city}"
	
	end

	#Consolidated the previous method can_i_fly into this one
	def self.book_flight(departure, destination)

		possible_flights = @@city_to_airplanes[departure]

		#Check available planes for those with a matching destination
		possible_flights.each do |flight|
			if (@@airplanes_to_destinations[flight] == destination && flight.passengers < flight.capacity)
				flight.passengers +=1
				puts "You booked a flight from #{departure} to #{destination}"
				return
			end
		end

		#Check for planes that have no destination yet at your current city and assign them one
		possible_flights.each do |flight|
			if (@@airplanes_to_destinations.has_key?(flight) == false)
				@@airplanes_to_destinations.store(flight, destination)
				flight.passengers +=1
				puts "You are special! A plane's destination has been set just for you, you're all booked!"
				return
			end
		end

		puts "No flights are available from your departure location to your destination"

	end

	#Testing method to ensure correct behavior
	def self.status()
		 puts "City to Airplanes hash -------------"
		 puts @@city_to_airplanes
		 puts "Airplanes to destinations hash ---------------"
		 puts @@airplanes_to_destinations
	end


end