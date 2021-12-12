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

  it 'can validate single coordinates' do
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
    expect(board.consecutive_numbers(["A1", "A2", "A3"])).to eq(true)
    expect(board.consecutive_numbers(["B2", "B3", "B4"])).to eq(true)
    expect(board.consecutive_numbers(["C1", "C3", "C4"])).to eq(false)
    expect(board.consecutive_numbers(["D1", "D4", "D2"])).to eq(false)
    expect(board.consecutive_numbers(["B4", "B2", "B1"])).to eq(false)
  end

  it 'make sure vertical numbers are consecutive' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.consecutive_letters(["A2", "B2"])).to eq(true)
    expect(board.consecutive_letters(["B3", "C3", "D3"])).to eq(true)
    expect(board.consecutive_letters(["A1", "A2", "A3"])).to eq(false)
    expect(board.consecutive_letters(["C1", "C3"])).to eq(false)
    expect(board.consecutive_letters(["D1", "D4", "D2"])).to eq(false)
    expect(board.consecutive_letters(["B4", "B2", "B1"])).to eq(false)
  end

  it 'can check if coordinates share same number' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.same_number(["C2", "C3"])).to eq(false)
    expect(board.same_number(["A1", "B1", "C1"])).to eq(true)
  end

  it 'can check if coordinates share same letter' do
   board = Board.new
   cruiser = Ship.new("Cruiser", 3)
   submarine = Ship.new("Submarine", 2)
   expect(board.same_letter(["C1", "C2"])).to eq(true)
   expect(board.same_letter(["A1", "B1"])).to eq(false)
 end

 it 'can validate that a set of coordinates are consecutive' do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
  expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
  expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
  expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
end

 it 'ensures coordinates cannot be diagonal' do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
  expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
end

it 'can validate correct coordinates' do
 board = Board.new
 cruiser = Ship.new("Cruiser", 3)
 submarine = Ship.new("Submarine", 2)
 expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
 expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
end

it 'can place a ship in its cells' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end

end
