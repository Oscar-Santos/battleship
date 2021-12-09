class Cell
  attr_reader :coordinate
  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
  end
end
