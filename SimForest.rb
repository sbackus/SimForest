require 'rubygems'
require 'Hasu'

Hasu.load 'tree.rb'
Hasu.load 'calendar.rb'
Hasu.load 'menu.rb'
Hasu.load 'cursor.rb'

class SimForest < Hasu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @calendar = Calendar.new
    @tree = Tree.new(30,30)
    @menu = Menu.new(self)
    @cursor = Cursor.new
  end

  def update
    @tree.update!(@calendar)
  end

  def draw
    @tree.draw(self)
    @menu.draw(self)
    @cursor.draw(self)
  end
 
  def button_down(button)
    case button
    when Gosu::KbEscape
      close
    end
  end

  def button_up(button)

  end
end

SimForest.run