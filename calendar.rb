require "singleton"

class Calendar

	attr_reader :speed

	def initialize
		@speed = 0.00286
	end

	def set_speed(speed)
		@speed = speed
	end
end