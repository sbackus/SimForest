class MenuItem
    HOVER_OFFSET = 3
    def initialize (window, text, x, y, z, callback)
        @window = window
        @text = text
        @active_image = Gosu::Image.from_text(@window, text, "Arial", 20)
        @original_x = @x = x
        @original_y = @y = y
        @z = z
        @callback = callback
    end

    def draw
        @active_image.draw(@x, @y, @z)
    end

    def update
        if is_mouse_hovering then
            @x = @original_x + HOVER_OFFSET
            @y = @original_y + HOVER_OFFSET
        else 
            @x = @original_x
            @y = @original_y
        end
    end

    def is_mouse_hovering
        mx = @window.mouse_x
        my = @window.mouse_y

        (mx >= @x and my >= @y) and (mx <= @x + @active_image.width) and (my <= @y + @active_image.height)
    end

    def clicked
        if is_mouse_hovering then
            @callback.call
        end
    end
end