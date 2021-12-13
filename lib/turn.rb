require './lib/game'
require './lib/board'
class Turn
  attr_reader :player,
              :computer,
              :computer_sunk,
              :player_sunk

  def initialize(player, computer)
    @player = player
    @computer = computer
    @computer_sunk = 0
    @player_sunk = 0
  end

  def render_boards
    puts "-------------COMPUTER BOARD--------------"
    puts @computer.board.render
    puts "--------------PLAYER BOARD----------------"
    puts @player.board.render(show = true)
  end

  def player_turn(player)
    puts "Enter the coordinate for your shot:"
    player_input = gets.chomp.upcase
    if computer.board.valid_coordinate?(player_input) == true
      computer.board.cells[player_input].fire_upon
      if computer.board.cells[player_input].render(show = true) == "M"
        puts "Your shot on #{player_input} was a miss."
      elsif computer.board.cells[player_input].render(show = true) == "H"
        puts "Your shot on #{player_input} was a hit."
      elsif computer.board.cells[player_input].render(show = true) == "X"
        puts "Direct hit! You sunk a ship!"
        @computer_sunk += 1
      end
    else
      puts "Please enter a valid coordinate."
    end
  end

  def computer_turn(computer)
    # takes a random number from the array of cell keys
    computer_input = player.board.cells.keys.sample()
    # until the coordinates randomly chosen are valid AND not fired upon, random coordinates will be chosen
    until player.board.valid_coordinate?(computer_input) && (player.board.cells[computer_input].fired_upon? == false)
      computer_input = player.board.cells.keys.sample
    end
    @player.board.cells[computer_input].fire_upon
    if player.board.cells[computer_input].render(show = true) == "M"
      puts "Computer shot on #{computer_input} was a miss."
    elsif player.board.cells[computer_input].render(show = true) == "H"
      puts "Computer shot on #{computer_input} was a hit."
    elsif player.board.cells[computer_input].render(show = true) == "X"
      puts "Computer shot on #{computer_input} sunk your #{player.board.cells[computer_input].ship.name}!"
      @player_sunk += 1
    end
  end
end
