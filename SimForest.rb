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
    
  end

  def update
    
  end

  def draw
    
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