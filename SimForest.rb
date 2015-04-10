require 'rubygems'
require 'Hasu'

Hasu.load 'tree.rb'
Hasu.load 'calendar.rb'
Hasu.load 'menu.rb'
Hasu.load 'cursor.rb'
Hasu.load 'maple.rb'

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
    @cursor = Cursor.new
  end

  def update
    @trees.each {|tree| tree.update!(@calendar)}
    @calendar.update!
  end

  def draw
    @trees.each {|tree| tree.draw(self)}
    @menu.draw(self,@calendar)
    @cursor.draw(self)
  end
 
  def button_down(button)
    case button
    when Gosu::KbEscape
      close
    when Gosu::MsLeft
      @trees << Maple.new(mouse_x, mouse_y)
    end

  end

  def button_up(button)

  end
end

SimForest.run