class Tree

	attr_reader :x, :y, :age

	def initialize(x, y)
		@x = x
		@y = y
		@age = 0.01
	end

	def size 
		age < 20 ? age : 20
	end

	def x1; @x - size/2; end
	def x2; @x + size/2; end
	def y1; @y - size/2; end
	def y2; @y + size/2; end

	def color
		Gosu::Color::GREEN
	end

	def draw(window)
		window.draw_quad(
			x1, y1, color,
			x1, y2, color,
			x2, y2, color,
			x2, y1, color,
		)
	end

	def update!
		@age += 0.01
	end
end