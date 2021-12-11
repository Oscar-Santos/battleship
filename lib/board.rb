class Board
  attr_reader :cells

  def initialize
  @cells =
    {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    if @cells.keys.include?(coordinate)
      true
    else
      false
    end
  end

  def valid_placement?(ship, coordinates)
    if ship.length == coordinates.length
      true
    else
      false
    end
  end

  # checks if numbers are consecutive
  # sorts through array and returns an array of numbers that correlate with row of numbers
  def consecutive_numbers(coordinates)
    x = coordinates.map do |coordinate|
      #  => "A1"
      coordinate.split("")
      # => ["A", "1"]
    end.map do |number|
      number.last
      # => ["1" "2" "3"]
    end
    # accounts for submarine
    if x.length == 2
      # if second number generated from array above - first number
      # == 1 then it is consecutive. ex; A1 and A2 => 2-1 == 1
      if x[1].to_i - x[0].to_i == 1
        true
      else
        false
      end
      # accounts for cruiser
    elsif x.length == 3
      # if third number generated from array above - first number
      # == 2 then it is consecutive
      if x[2].to_i - x[0].to_i == 2
        true
      else
        false
      end
    end
  end

  def consecutive_letters(coordinates)
    y = coordinates.map do |coordinate|
      coordinate.split("")
    end.map do |letter|
      letter.first
    end

   
  end
end
