require './lib/board'
require './lib/computer'
require './lib/player'

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
end
