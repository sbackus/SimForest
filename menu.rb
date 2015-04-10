class Menu
	WIDTH = 100
	HEIGHT = 50

	def initialize(window)
		@font = Gosu::Font.new(window, "Ariel", 30)
	end

	def draw(window,calendar)
		@font.draw(calendar.day, 0, 60, 0)
		@font.draw(calendar.season, 0, 30, 0)
		@font.draw(calendar.year, 0, 0, 0)
	end
end
