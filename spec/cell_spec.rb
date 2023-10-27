require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  describe '#initialize' do
    it 'has @coordinate, @ship' do
      cell = Cell.new("B4")

      expect(cell).to be_an_instance_of(Cell)
      expect(cell.coordinate).to eq("B4")
      expect(cell.ship).to eq([])
    end
  end

  describe '#empty?' do
    it 'can tell if @coordinate is empty' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      expect(cell.empty?).to eq(true)
      expect(cell.coordinate).to eq([])
    end
  end

  describe '#place_ship' do
    it 'will place ship in Cell' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.coordinate).to eq([cruiser])
      expect(cell.empty?).to eq(false)
    end
  end

  describe '#fired_upon' do
    it 'will damage the Ship' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      cell.fired_upon
      expect(cell.ship.health).to eq(2)
    end
  end

  descrive '#fired_upon?' do
    it 'will determine if the Ship was fired upon' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.fired_upon?).to eq(false)

      cell.fired_upon

      expect(cell.fired_upon?).to eq(true)
    end
  end
end
