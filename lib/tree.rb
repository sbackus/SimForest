# generic tree
class Tree
	MAX_SIZE = 20
	GROWTH_RATE = 360
	attr_reader :x, :y, :age

	def initialize(x, y)
		@x = x
		@y = y
		@age = GROWTH_RATE * 2.0
		@color = Gosu::Color::GREEN.dup
	end

	def size 
		age/GROWTH_RATE < MAX_SIZE ? age/GROWTH_RATE : MAX_SIZE
	end

	def x1; @x - size/2; end
	def x2; @x + size/2; end
	def y1; @y - size/2; end
	def y2; @y + size/2; end

	def draw(window)
		window.draw_quad(
			x1, y1, @color,
			x1, y2, @color,
			x2, y2, @color,
			x2, y1, @color,
		)
	end

	def update!(calendar)
		@age += calendar.speed
	end
end