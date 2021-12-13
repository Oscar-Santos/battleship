class Player
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
      p "Enter 3 coordinates for your cruiser. For example:   A1, B1, C1    or     A1, A2, A3"
      cruiser = @cruiser
      cruiser_coordinates = gets.chomp.upcase("").split
      if board.valid_placement?(cruiser, cruiser_coordinates) == true
        @board.place(cruiser, cruiser_coordinates)
      else
        p "Invalid coordinates. Please try again."
      end
      break
    end
  end

  def place_submarine
    loop do
      print "Enter 2 coordinates for your submarine. For example:    A1, B1   or    A1, A2"
      submarine = @submarine
      submarine_coordinates = gets.chomp.upcase("").split
      if board.valid_placement?(submarine, submarine_coordinates) == true
        @board.place(submarine, submarine_coordinates)
      else
        p "Invalid coordinates. Please try again."
      end
      break
    end
  end
end
