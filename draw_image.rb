class DrawImage
    COLOR = 'O'

    def initialize(col, row)
      @pixel_data = color_pixels(col, row)
    end

    def fill_colour(x, y, colour)
      @pixel_data[y.pred][x.pred] = colour
    end

    def vertical(x, y1, y2, colour)
      (y1..y2).each do |y|
        colourize(x, y, colour)
      end
    end

    def region(x, y, colour)
      target_colour = @pixel_data[y.pred][x.pred]
      flood_fill(x, y, target_colour, colour)
    end

    def horizontal(x1, x2, y, colour)
      (x1..x2).each do |x|
        colourize(x, y, colour)
      end
    end

    def to_s
      @pixel_data.map {|pixel| pixel.join(' ')}.join("\n")
    end

    def clear
      @pixel_data.map! do |pixel|
        pixel.map! {COLOR}
      end
    end

    private
    def flood_fill(x, y, target_colour, replacement_colour)
      if within_bounds(x, y) && @pixel_data[y.pred][x.pred] == target_colour
        @pixel_data[y.pred][x.pred] = replacement_colour
        flood_fill(x, y.pred, target_colour, replacement_colour)
        flood_fill(x, y.next, target_colour, replacement_colour)
        flood_fill(x.pred, y, target_colour, replacement_colour)
        flood_fill(x.next, y, target_colour, replacement_colour)
      end
    end

    def color_pixels(col, row)
      [].tap {|pixels| row.times {pixels << Array.new(col, COLOR)}}
    end

    def within_bounds(x, y)
      x >= 1 && x <= @pixel_data.first.size &&
      y >= 1 && y <= @pixel_data.size
    end
end
