#maple trees change color in the fall
require './calendar.rb'

class Maple < Tree

	def initialize(x, y)
		super(x, y)
		@color.blue = 0
	end

	def update!(calendar)
		super(calendar)
		# print "#{calendar.new_day?}, #{@color.red}, #{@color.green}, #{@color.blue} \n"
		if calendar.speed >= 1 || calendar.speed < 1 && rand < calendar.speed / 2
			change_amount = [1, (calendar.speed/2.0).round].max
			if calendar.season == Calendar::FALL
				@color.red += change_amount
				@color.green -= change_amount
			elsif calendar.season == Calendar::WINTER
				if @color.red > 75; @color.red -=  change_amount; end 
				if @color.green < 50; @color.green += change_amount; end 
			elsif calendar.season == Calendar::SPRING
				@color.green +=  change_amount
				@color.red -= change_amount
			elsif calendar.season == Calendar::SUMMER
				@color.red +=  change_amount
			end
		end
	end

	def color 
		@color
	end


end