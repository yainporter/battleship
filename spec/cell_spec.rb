require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  describe '#initialize' do
    it 'has @coordinate, @ship, and @shots_fired' do
      cell = Cell.new("B4")

      expect(cell).to be_an_instance_of(Cell)
      expect(cell.coordinate).to eq("B4")
      expect(cell.ship).to eq(nil)
      expect(cell.shots_fired).to eq(0)
    end
  end

  describe '#empty?' do
    it 'can tell if @coordinate is empty' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      expect(cell.empty?).to eq(true)
      expect(cell.ship).to eq(nil)
    end
  end

  describe '#place_ship' do
    it 'will place ship in Cell' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end
  end

  describe '#fired_upon' do
    it 'will damage the Ship' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      cell2 = Cell.new("A4")

      cell.fired_upon
      expect(cell.ship.health).to eq(2)
      expect(cell.shots_fired).to eq(1)

      expect(cell2.fired_upon).to eq(nil)
      expect(cell2.shots_fired).to eq(1)
    end
  end

  describe '#fired_upon?' do
    it 'will determine if the Ship was fired upon' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)

      expect(cell.fired_upon?).to eq(false)

      cell.fired_upon

      expect(cell.fired_upon?).to eq(true)
    end
  end

  describe '#render' do
    it 'will return a String representation of the Cell to be printed to the board' do

      cell = Cell.new("B4")
      expect(cell.render).to eq(".")

      cell.fired_upon

      expect(cell.render).to eq("M")

      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      cell.fired_upon

      expect(cell.render).to eq("H")
      cell.fired_upon
      cell.fired_upon

      expect(cell.reder).to eq("X")

    end
  end
end
