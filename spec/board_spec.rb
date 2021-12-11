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

  it 'occupies coordinates that are equal to the length of the ship' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
  end

  it 'ensures horizontal numbers are consecutive' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # require "pry"; binding.pry
    expect(board.consecutive_numbers(["A1", "A2", "A3"])).to eq(true)
    expect(board.consecutive_numbers(["B2", "B3", "B4"])).to eq(true)
    expect(board.consecutive_numbers(["C1", "C3", "C4"])).to eq(false)
    expect(board.consecutive_numbers(["D1", "D4", "D2"])).to eq(false)
    expect(board.consecutive_numbers(["B4", "B2", "B1"])).to eq(false)
  end
end
