class Menu
	WIDTH = 100
	HEIGHT = 50

	def initialize(window)
		@font = Gosu::Font.new(window, "Ariel", 30)
	end

	def draw(window)
    	@font.draw("time", SimForest::WIDTH-50, 30, 0)
	end
end
