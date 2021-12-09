require 'pry'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_instance_of(Cell)
  end

  it 'has coordinates' do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end

  it 'can be empty' do
   cell = Cell.new("B4")
   expect(cell.ship).to eq(nil)
   expect(cell.empty?).to eq(true)
  end

  it 'can be occupied by a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end

  it 'can be fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to eq(false)
    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end

  it 'is . if empty and M if fired upon while empty' do
    cell_1 = Cell.new("B4")
    cell_1.render
    expect(cell_1.render).to eq(".")
    cell_1.fire_upon
    cell_1.render
    expect(cell_1.render).to eq("M")
  end

end
