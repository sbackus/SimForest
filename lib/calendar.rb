require "singleton"

class Calendar
	SPRING = 0
	SUMMER = 1
	FALL   = 2
	WINTER = 3

	attr_reader :speed, :season

	def initialize(speed = 0.25)
		@speed = speed
		@day_count = 0.0
	end

	def set_speed(speed)
		@speed = speed
	end

	def increase_speed!
		@speed += @speed/2
	end

	def decrease_speed!
		@speed -= @speed/2
	end

	def update!
		@day_count += @speed
	end

	def day
		@day_count.round
	end

	def season_count
		(@day_count/90).round
	end

	def year
		(day/360).round
	end

	def season
		(season_count % 4).round
	end

end