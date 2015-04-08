require 'rubygems'
require 'Hasu'

Hasu.load 'tree.rb'

class SimForest < Hasu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @tree = Tree.new(30,30)
  end

  def update
    @tree.update!
  end

  def draw
    @tree.draw(self)
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