
class Pet
	def setNoise(noise)
		@noise = noise
	end

	def speak
		Kernel.puts("The pet made an #{@noise} noise!")
	end

	def cleanup(poops)
		Kernel.put("You cleaned up #{poops} poops!")
	end

	def brush(swipes)
		Kernel.put("You brushed the pet #{swipes} times!")
	end
end

#my class
class Car
	def start
		Kernel.puts("Revving the engine!")
	end

	def setCruisingSpeed(speed)
		@cruisingSpeed = speed
		Kernel.puts("Cruise control set for #{@cruisingSpeed} miles per hour")
	end

	def setStereoVolume(volume)
		@steroVolume = volume
		Kernel.puts("Volume set to #{@steroVolume}")
	end
end

class Marker
	def set_color(my_color)
		@color = my_color
	end

	def write
		Kernel.puts("I am writing with a #{@color} marker!")
	end
end

#Converting things to use the send method
5.send(:*, 5)
"omg".send(:upcase)
['a','b','c'].send(:at, 1)
['a','b','c'].send(:insert, 2, 'o', 'h', 'n', 'o' )
{}.send(:size)
{character: "Mario"}.send(:has_key?, :character)

#Converting things to NOT use the send method
6-32
{html: true, json: false}.keys
"MakerSquare" * 6
"MakerSquare".split('a')
['alpha', 'beta'][3]

