class RaceTrack

	def initialize
		@start = false
		@cars = []
		@time = 0
	end

	def addRaceCar(car)
		if (@start == false)
			@cars.push(car)
		end
	end

	def start
		@start = true
		@cars.each do |x|
			x.speed = 60 + rand(20)
		end
	end

	def forward
		if (@time < 5)
			@time = @time + 1
			@cars.each do |x|
				x.distance = x.distance + x.speed
				x.speed = x.speed + 0 + rand(20)
			end
		end	
	end

	def racerStatus
		if (@time == 5)
			puts "Race over!"
			maxDistance = 0
			winner = ""
			@cars.each do |x|
				x.speed = 0
				if (x.distance > maxDistance)
					maxDistance = x.distance
					winner = x.name	
				end
			end
			puts "The winner is #{winner} who has traveled #{maxDistance}"
			puts "All cars are stopped!"
		else
			puts "We are in hour #{@time} of the race..."
			@cars.each do |x|
				puts "#{x.name} is going #{x.speed} and has traveled #{x.distance} miles"
			end
		end
	end
end

class RaceCar

	def initialize(name)
		@name = name
		@speed=0
		@distance=0
	end

	attr_accessor :name
	attr_accessor :speed
	attr_accessor :distance


end
