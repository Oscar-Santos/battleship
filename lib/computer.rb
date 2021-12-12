class Computer
  attr_reader :board,
              :cruiser,
              :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def place_cruiser
    loop do
      cruiser_coordinates = []
      until cruiser_coordinates.length == cruiser.length do
        cruiser_coordinates << board.cells.keys.sample
      end
      if board.valid_placement?(cruiser, cruiser_coordinates)
        @board.place(cruiser, cruiser_coordinates)
        break
      end
  end

  def place_submarine
  end
end
