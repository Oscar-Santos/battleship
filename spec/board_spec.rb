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

  it 'can validate coordinates' do
    board = Board.new
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
    expect(board.valid_coordinate?("A32")).to eq(false)
    expect(board.valid_coordinate?("A3")).to eq(true)
  end
end
