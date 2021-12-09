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

  def place_ship(new_ship)
    @ship = new_ship
  end
end
