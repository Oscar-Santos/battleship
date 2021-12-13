require './lib/game'

RSpec.describe Game do
  it 'exists' do
    player = Player.new
    computer = Computer.new
    game = Game.new(computer, player)
    expect(game).to be_instance_of(Game)
  end
  
end
