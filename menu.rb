# http://blog.dreasgrech.com/2010/08/simple-menu-for-gosu-game-in-ruby.html
class Menu
    def initialize (window)
        @window = window
        @items = Array.new
    end

    def add_item (text, x, y, z, callback = nil)
        item = MenuItem.new(@window, text, x, y, z, callback)
        @items << item
        self
    end

    def draw
        @items.each do |i|
            i.draw
        end
    end

    def update
        @items.each do |i|
            i.update
        end
    end

    def clicked
        @items.each do |i|
            i.clicked
        end
    end
end
