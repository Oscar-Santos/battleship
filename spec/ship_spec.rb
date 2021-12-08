require './lib/ship'

RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_instance_of(Ship)
  end

  it 'has a name and length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
  end

  it "does not sink if it has health" do
  cruiser = Ship.new("Cruiser", 3)
  cruiser.hit
  expect(cruiser.health).to be(2)
  cruiser.hit
  expect(cruiser.health).to be(1)
  expect(cruiser.sunk?).to be(false)
  end

  it "sinks if health = 0" do
  cruiser = Ship.new("Cruiser", 3)
  cruiser.hit
  expect(cruiser.sunk?).to be(false)
  expect(cruiser.health).to be(2)
  cruiser.hit
  expect(cruiser.health).to be(1)
  cruiser.hit
  expect(cruiser.health).to be(0)
  expect(cruiser.sunk?).to be(true)
  end
end
