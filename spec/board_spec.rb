require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_instance_of(Board)
  end
end 
