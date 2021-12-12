require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'

RSpec.describe Player do
  it 'exists' do
    player = Player.new
    expect(player).to be_instance_of(Player)
  end

  it 'has a board and ship attributes' do
    player = Player.new
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(player.board).to be_instance_of(Board)
    expect(player.cruiser).to be_instance_of(Ship)
    expect(player.submarine).to be_instance_of(Ship)
  end
end
