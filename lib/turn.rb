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
end
