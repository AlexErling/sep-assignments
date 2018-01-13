require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(width, Array.new(height, nil))
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    self.matrix[x][y] = pixel
  end

  def at(x, y)
    inbounds(x, y) ? self.matrix[x][y] : nil
  end

  private

#determining if the location is within the width and height constraints and greater than 0
  def inbounds(x, y)
    ((x < width || x > 0)) || (y < height || y > 0)
  end

end
