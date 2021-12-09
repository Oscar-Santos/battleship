class Cell
  attr_reader :coordinate
  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    if @ship == nil
      true
    else @ship == ship
      false
    end
  end
end
