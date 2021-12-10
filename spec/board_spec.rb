require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_instance_of(Board)
  end

  it 'has attributes' do
    board = Board.new
    expect(board.cells).to be_a(Hash)
  end

  it 'has 16 cells, with keys that point to cell objects' do
    board = Board.new
    expect(board.cells.keys.length).to eq(16)
    expect(board.cells.values.length).to eq(16)
  end
end
