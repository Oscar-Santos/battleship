require './lib/cell'
require './lib/ship'
require './lib/player'
require './lib/computer'
require './lib/board'
require './lib/turn'

class Game
  attr_reader :computer,
              :player,
              :computer_sunk,
              :player_sunk

  def initialize(computer, player)
    @computer = computer
    @player = player
    @computer_sunk = 0
    @player_sunk = 0
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

  def start
    main_menu

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "The board is below"
    puts player.board.render

    player_setup
    computer_setup

    # We'll add play method here once created
  end

  def player_setup
    player.place_cruiser
    puts player.board.render(show = true)
    player.place_submarine
  end

  def computer_setup
    computer.place_cruiser
    computer.place_submarine
  end

  def player_loses
    player_sunk == 2
  end

  def computer_loses
    computer_sunk == 2
  end
end
