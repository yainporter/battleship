require './lib/ship'

RSpec.describe Ship do 
  describe '#initialize' do
    it 'has @name, @length and @health' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser).to be_an_instance_of(Ship)
      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
      expect(cruiser.health).to eq(3)
    end
  end

  describe '#hit' do 
    it 'can damage ships' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.health).to eq(3)

      cruiser.hit

      expect(cruiser.health).to eq(2)      
    end  
  end

  describe '#sunk?' do
    it 'can tell if the ship has sunk once @health reaches 0' do 
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.sunk?).to eq(false)
      
      cruiser.hit

      expect(cruiser.sunk?).to eq(false)

      cruiser.hit
      cruiser.hit

      expect(cruiser.sunk?).to eq(true)
    end
  end
end