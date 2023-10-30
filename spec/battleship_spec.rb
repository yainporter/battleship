require './spec/spec_helper'

RSpec.describe Battleship do
  describe '#initialize' do
    it 'can initialize the game with @player_input, and @board' do
      expect(battleship = Battleship.new).to be_a(Battleship)
      expect(battleship.check_player_input).to eq(nil)
      expect(battleship.board).to be_a(Board)
    end

    it 'has the option to pass in a parameter for @check_player_input' do
      battleship = Battleship.new("p")

      expect(battleship.check_player_input).to eq("p")
    end
  end

  describe '#main_menu' do
    it 'can print the #main_menu welcome message' do
      battleship = Battleship.new

      expect(battleship.main_menu).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
    end
  end

  describe '#setup' do

    it 'has a #computer_setup helper method that lays out the board for the computer' do
      battleship_game = Battleship.new
      battleship_game.computer_setup

      expect(battleship_game.board.cells.values.select{|cell| cell.empty? == false}.count).to eq(5)
      battleship_game.board.cells.values.each do |cell|
        expect(cell).to be_a(Cell)
      end
    end

    it 'directs the player what to do after setting the computers board' do
      battleship_game = Battleship.new

      expect(battleship_game.setup).to eq("I have laid out my ships on the grid.\n
      You now need to lay out your two ships.\n
      The Cruiser is three units long and the Submarine is two units long.\n
        1 2 3 4\n
      A . . . .\n
      B . . . .\n
      C . . . .\n
      D . . . .\n")
    end
  end

  describe '#random_coordinate' do
    it 'generate a random coordinate from an Array of coordinates and generate an Array of random coordinates when an argument is given' do
      battleship_game = Battleship.new

      expect(battleship_game.random_coordinate(3).count).to be(3)
      expect(battleship_game.random_coordinate(2).count).to be(2)
      expect(battleship_game.random_coordinate(3)).to include(String)
    end
  end

  describe '#ship_message' do
    it 'generates a prompt for the user to place their cruiser or submarine' do
      battleship_game = Battleship.new

      expect(battleship_game.ship_message("cruiser")).to eq("Enter the squares for the Cruiser (3 spaces):\n >")
      expect(battleship_game.ship_message("submarine")).to eq("Enter the squares for the Submarine(2 spaces):\n > ")
      expect(battleship_game.ship_message("ship")).to eq("Error, try again")
    end
  end

  describe '#check_main_menu' do
    it 'can check whether the player put p or q, and responds correctly' do
      battleship = Battleship.new("p")

      expect(battleship.check_main_menu_input).to eq(nil)

      battleship = Battleship.new("1")

      expect(battleship.check_main_menu_input).to eq("OK, thanks for playing!")
    end
  end

  describe '#player_setup' do
    it 'can check to see if the player_input is valid' do
      battleship_game = Battleship.new

      # expect(player_setup).to eq("Enter the squares for the Submarine (2 spaces):")
    end
  end

  describe '#check_player_coordinates_for_ship' do
    it 'can check if the player coordinates are valid' do
      battleship_game = Battleship.new("A1, A2, A3")
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)  

      expect(battleship_game.check_player_coordinates(cruiser)).to eq(true)
      expect(battleship_game.check_player_coordinates(submarine)).to eq("Those are invalid coordinates. Please try again:\n >")

      battleship_game = Battleship.new("A1, B1, C1")

      expect(battleship_game.check_player_coordinates(cruiser)).to eq(true)

      battleship_game = Battleship.new("A1, B2, C3")

      expect(battleship_game.check_player_coordinates(cruiser)).to eq("Those are invalid coordinates. Please try again:\n >")
    end
  end

  describe '#invalid_coordinates' do
    it 'can tell the user that their coordinates are invalid, and prompt them to try again' do
      battleship_game = Battleship.new("A1, B2, C3") 

      expect(battleship_game.invalid_coordinates_msg).to eq("Those are invalid coordinates. Please try again:\n >")
    end
  end

  describe '#place_player_cruiser' do
    it 'can place the cruiser once the player coordinates chosen are valid' do
      battleship_game = Battleship.new("A1, B1, C1")
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)  
      battleship_game.place_player_ship(cruiser)
      cells_with_ship = 0
    
      battleship_game.board.cells.values.each do |cell|
        cell.ship != nil ? cells_with_ship += 1 : false
      end
      expect(cells_with_ship).to eq(3)

      battleship_game = Battleship.new("A1, B1")
      cells_with_ship = 0
      battleship_game.place_player_ship(submarine)
      battleship_game.board.cells.values.each do |cell|
        cell.ship != nil ? cells_with_ship += 1 : false
      end
      expect(cells_with_ship).to eq(2)
    end
  end

  describe '#cruiser' do
    it 'can create a cruiser ship' do
      battleship_game = Battleship.new

      expect(battleship_game.cruiser).to be_a(Ship)
      expect(battleship_game.cruiser.name).to eq("Cruiser")
    end
  end

  describe '#submarine' do
  it 'can create a submarine ship' do
    battleship_game = Battleship.new

    expect(battleship_game.submarine).to be_a(Ship)
    expect(battleship_game.submarine.name).to eq("Submarine")
  end
end
end