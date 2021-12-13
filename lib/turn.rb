require './lib/board'
require './lib/computer'
require './lib/player'

class Turn
  attr_reader :player,
              :computer

  def initialize(player, computer)
    @player = player
    @computer = computer
  end

  def render_boards
    puts "-------------COMPUTER BOARD--------------"
  puts @computer.board.render
  puts "--------------PLAYER BOARD----------------"
  puts @player.board.render(show = true)
  end
end
