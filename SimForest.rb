require 'rubygems'
require 'Hasu'

Hasu.load 'tree.rb'
Hasu.load 'calendar.rb'
Hasu.load 'menu.rb'
Hasu.load 'cursor.rb'
Hasu.load 'maple.rb'
Hasu.load 'menu_item.rb'

class SimForest < Hasu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @calendar = Calendar.new
    @trees = []
    @menu = Menu.new(self)
    @menu.add_item("Menu Item 1", 0, 0, 1, lambda { self.close })
    @menu.add_item("Menu Item 2", 0, 23, 1, lambda { self.close })
    @cursor = Cursor.new
  end

  def update
    @trees.each {|tree| tree.update!(@calendar)}
    @calendar.update!
    @menu.update
  end

  def draw
    @trees.each {|tree| tree.draw(self)}
    @menu.draw
    @cursor.draw(self)
  end
 
  def button_down(button)
    case button
    when Gosu::KbEscape
      close
    when Gosu::MsLeft
      @menu.clicked
      @trees << Maple.new(mouse_x, mouse_y)
    end

  end

  def button_up(button)

  end
end

SimForest.run