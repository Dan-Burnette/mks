class Chimpanzee 

	def initialize()
		@bananas_eaten = 0
		@is_clean = true
	end

	def yell()
	end

	def eat()
		@bananas_eaten +=1
		@is_clean = false
		puts "eats and makes himself all dirty..."
	end

	def eaten()
		@bananas_eaten
		
	end

	def groom()
		if (@is_clean == false)
			puts "This monkey needs a shower!"
		end
	end

end