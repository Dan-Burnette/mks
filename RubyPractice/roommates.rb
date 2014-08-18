class Roommate

	@@total_beer = 0
	@@roommates = []

	def initialize()
		@beer_count = 0
		@@roommates << self

	end

	def self.total_beer_count
		@@total_beer
	end


	def drink_beer()
		@beer_count +=1
		@@total_beer +=1
		puts "yum"
	end

	def self.take_a_round()
		@@roommates.each do |x|
			x.drink_beer
		end
	end




end