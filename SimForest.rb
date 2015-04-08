require 'rubygems'
require 'Hasu'

Hasu.load 'tree.rb'
Hasu.load 'calendar.rb'
Hasu.load 'menu.rb'

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
  end

  def update
    @tree.update!(@calendar)
  end

  def draw
    @tree.draw(self)
    @menu.draw(self)
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