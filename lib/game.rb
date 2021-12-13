require './lib/cell'
require './lib/ship'
require './lib/player'
require './lib/computer'
require './lib/board'
require './lib/turn'

class Game
  attr_reader :computer,
              :player

  def initialize(computer, player)
    @computer = computer
    @player = player
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    response = gets.chomp.downcase
    if response == "p"
      puts "Excellent. Let us commence."
    elsif response == "q"
      puts "Too bad, come back sometime!"
    else response != "p" || "q"
      puts "Invalid response, please try again."
    end
  end

  def player_setup
    player.place_cruiser
    puts player.board.render(show = true)
    player.place_submarine
  end
end
