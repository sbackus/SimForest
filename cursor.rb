
  class Cursor
  
  SIZE = 1.1

  def initialize

  end

  def x1; @x - SIZE/2; end
  def x2; @x + SIZE/2; end
  def y1; @y - SIZE/2; end
  def y2; @y + SIZE/2; end

  def draw(window)

    @x = window.mouse_x
    @y = window.mouse_y

    color = Gosu::Color::GREEN
    window.draw_quad(
      x1, y1, color,
      x1, y2, color,
      x2, y2, color,
      x2, y1, color,
    )
  end

  end