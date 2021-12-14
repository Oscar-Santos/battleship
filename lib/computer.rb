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
      all_coordinates = board.cells.keys
      cruiser_coordinates = []
      until board.valid_placement?(cruiser, cruiser_coordinates)
        cruiser_coordinates = all_coordinates.sample(3)
      end
      board.place(cruiser, cruiser_coordinates)
  end

  def place_submarine
      all_coordinates = board.cells.keys
      submarine_coordinates = []
      until board.valid_placement?(submarine, submarine_coordinates)
        submarine_coordinates = all_coordinates.sample(2)
      end
      board.place(submarine, submarine_coordinates)
  end
end
