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
end
