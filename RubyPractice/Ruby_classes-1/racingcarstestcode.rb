require_relative 'racingcars'

car_a = RaceCar.new("Billy")
car_b = RaceCar.new("Jenny")
car_c = RaceCar.new("Alberto")

track_a = RaceTrack.new
track_a.addRaceCar(car_a)
track_a.addRaceCar(car_b)
track_a.addRaceCar(car_c)

track_a.start
track_a.racerStatus

#hour 1
track_a.forward
track_a.racerStatus

#hour 2
track_a.forward
track_a.racerStatus

#hour 3
track_a.forward
track_a.racerStatus

#hour 4
track_a.forward
track_a.racerStatus

#hour 5
track_a.forward
track_a.racerStatus





