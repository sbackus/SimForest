require 'Hasu'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| Hasu.load file }

# Hasu.load 'tree.rb'
# Hasu.load 'calendar.rb'
# Hasu.load 'menu.rb'
# Hasu.load 'cursor.rb'
# Hasu.load 'maple.rb'
# Hasu.load 'menu_item.rb'

class SimForest < Hasu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @calendar = Calendar.new
    @trees = []
    @planting = "Pine"
    @menu = Menu.new(self)
    @menu.add_item("Speed up time", 0, 0, 1, lambda { @calendar.increase_speed! })
    @menu.add_item("Slow down time", 0, 23, 1, lambda { @calendar.decrease_speed! })
    @menu.add_item("Plant Maples", 0, 46, 1, lambda { @planting = "Maple" })
    @menu.add_item("Plant Pines", 0, 69, 1, lambda { @planting = "Pine" })

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
      if mouse_x < 150 && mouse_y < 100
        @menu.clicked
      else
        if @planting == "Maple"
          @trees << Maple.new(mouse_x, mouse_y)
        else
          @trees << Tree.new(mouse_x, mouse_y)
        end
      end
    end

  end

  def button_up(button)

  end
end

SimForest.run