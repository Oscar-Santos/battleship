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
    valid_coordinates = false
    until valid_coordinates == true do
      puts "Enter 3 coordinates for your cruiser. For example:   A1, B1, C1    or     A1, A2, A3"
      puts " "
      cruiser_coordinates = gets.chomp.upcase.gsub(',','').split
      if board.valid_placement?(cruiser, cruiser_coordinates) == true
        @board.place(cruiser, cruiser_coordinates)
        valid_coordinates = true
      else
        puts "Invalid coordinates. Please try again."
      end
    end
  end

  def place_submarine
    valid_coordinates = false
    until valid_coordinates == true do
      puts "Enter 2 coordinates for your submarine. For example:    A1, B1   or    A1, A2"
      puts " "
      submarine_coordinates = gets.chomp.upcase.gsub(',','').split
      if board.valid_placement?(submarine, submarine_coordinates) == true
        @board.place(submarine, submarine_coordinates)
        valid_coordinates = true
      else
        p "Invalid coordinates. Please try again."
      end
    end
  end
end
