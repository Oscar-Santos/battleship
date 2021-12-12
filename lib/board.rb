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
    if ship.length == coordinates.length && !coordinates.any? {|coordinate| @cells[coordinate].ship} == true
      if consecutive_numbers(coordinates) && same_letter(coordinates) || consecutive_letters(coordinates) && same_number(coordinates)
        true
      else
        false
      end
    else
      false
    end
  end

  def consecutive_numbers(coordinates)
    x = coordinates.map do |coordinate|
      coordinate.split("")
    end.map do |number|
      number.last
    end

    if x.length == 2
      if x[1].to_i - x[0].to_i == 1
        true
      else
        false
      end

    elsif x.length == 3
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

    if y.length == 2
      if y[1].ord - y[0].ord == 1
        true
      else
        false
      end

    elsif y.length == 3
      if y[2].ord - y[0].ord == 2
        true
      else
        false
      end
    end
  end

  def same_number(coordinates)
    target_number = coordinates.first[-1]
    coordinates.all? do |cord|
      target_number == cord[-1]
    end
  end

  def same_letter(coordinates)
    target_letter = coordinates.first[0]
    coordinates.all? do |cord|
      target_letter == cord[0]
    end
  end

  def place(ship, coordinates)
    coordinates.map do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render(show = false)
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(show)} #{@cells["A2"].render(show)} #{@cells["A3"].render(show)} #{@cells["A4"].render(show)} \n" +
    "B #{@cells["B1"].render(show)} #{@cells["B2"].render(show)} #{@cells["B3"].render(show)} #{@cells["B4"].render(show)} \n" +
    "C #{@cells["C1"].render(show)} #{@cells["C2"].render(show)} #{@cells["C3"].render(show)} #{@cells["C4"].render(show)} \n" +
    "D #{@cells["D1"].render(show)} #{@cells["D2"].render(show)} #{@cells["D3"].render(show)} #{@cells["D4"].render(show)} \n"
  end
end
