require './lib/board'

RSpec.describe do
  describe "#initialize" do 
    it "has a cell attribute" do
      board = Board.new

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
  end

  describe '#valid_coordinate?' do
    it 'can tell if a coordinate is on the board or not' do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  end
end