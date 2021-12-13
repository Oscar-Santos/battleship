require './lib/game'

computer = Computer.new
player = Player.new

game = Game.new(computer, player)

game.start
