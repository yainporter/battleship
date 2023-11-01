require './spec/spec_helper'

RSpec.describe do
  describe "#initialize" do 
    it "has @cell and @name" do
      board = Board.new("Player")

      expect(board.cells).to be_a(Hash)
    end

    it "has cells that have 16 key/value pairs" do
      board = Board.new

      expect(board.cells.keys.count).to eq(16)
      expect(board.cells.values.count).to eq(16)

      board.cells.each do |key, value|
        expect(value).to be_a(Cell)
      end
    end

    it 'has @name to keep track of Board' do
      player_board = Board.new("Player")

      expect(player_board.name).to eq("Player")
      expect(player_board.name).to be_a(String)
    end
  end

  describe '#valid_coordinate?' do
    it 'can tell if a coordinate is on the board or not' do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end

    it 'can check to see if a cell is empty or not' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)

      expect(board.valid_coordinate?("B4")).to eq(true)

      board.cells["B4"].place_ship(cruiser)

      expect(board.valid_coordinate?("B4")).to eq(false)
    end
  end

  describe "#valid_placement??" do
    it "can tell if the coordinate array is the same as the ship length" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)  
    end
  end
  #     expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
  #     expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  #   end

  #   it "will check to see that coordinates are consecutive" do
  #     board = Board.new
  #     coordinates = ["A1", "A2", "A4"]
  #     cruiser = Ship.new("Cruiser", 3)
  #     submarine = Ship.new("Submarine", 2)    
  #     board.check_across(coordinates)
  #     expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
  #     board.check_across(coordinates)
  #     expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
  #     expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
  #     expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  #   end

  #   it "will assure that coordinates are not diagonal" do
  #     board = Board.new
  #     cruiser = Ship.new("Cruiser", 3)
  #     submarine = Ship.new("Submarine", 2) 
      
  #     expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
  #     expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  #   end

  #   it "assures placement is still valid after meeting all previous placement requirements" do
  #     board = Board.new
  #     cruiser = Ship.new("Cruiser", 3)
  #     submarine = Ship.new("Submarine", 2)    

  #     expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
  #     expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  #   end
  # end

  describe "#consecutive?" do
    it "determines if coordinates are consecutive" do
      board = Board.new
      coordinates = ["A1", "A2", "A4"]
      coordinates2  = ["A1", "A2", "A3"]

      expect(board.consecutive?(coordinates)).to eq(false)
      expect(board.consecutive?(coordinates2)).to eq(true)
    end

    it 'can check to make sure that the coordinate is empty' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)  
      board.place(cruiser, ["A1", "A2", "A3"])
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
    end
  end

  describe '#place' do
    it 'can place a ship within multiple cells' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3) 
      cell_1 = board.cells["A1"] 
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]
      board.place(cruiser, ["A1", "A2", "A3"]) 

      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cruiser)
      expect(cell_3.ship == cell_2.ship).to eq(true)
    end
  end

  describe '#render' do
    it 'can render a String representation of the board' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3) 
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it 'can have an option argument to indicate whether ships are hidden' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3) 
      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end