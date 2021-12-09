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
end
