require './spec/spec_helper'

RSpec.describe Turn do
  describe '#initialize' do
    it 'can initialize the game with @player_input, and @board' do
      player_turn = Turn.new("Player")
      expect(player_turn = Turn.new("Player")).to be_a(Turn)
      expect(player_turn.check_player_input).to eq(nil)
      expect(player_turn.board).to be_a(Board)
      expect(player_turn.name).to eq("Player")
    end

    it 'has the option to pass in a parameter for @check_player_input' do
      player_turn = Turn.new("Player", "p")

      expect(player_turn.check_player_input).to eq("p")
    end
  end

  describe '#computer_setup' do
    it 'has a #computer_setup helper method that lays out the board for the computer' do
      player_turn = Turn.new("Player")
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      player_turn.computer_setup(cruiser, submarine)

      expect(player_turn.board.cells.values.select{|cell| cell.empty? == false}.count).to eq(5)
      player_turn.board.cells.values.each do |cell|
        expect(cell).to be_a(Cell)
      end
    end
  end

  describe '#random_coordinate' do
    it 'generate a random coordinate from an Array of coordinates and generate an Array of random coordinates when an argument is given' do
      player_turn = Turn.new("Player")
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(player_turn.random_coordinate(cruiser).count).to be(3)
      expect(player_turn.random_coordinate(submarine).count).to be(2)
      expect(player_turn.random_coordinate(cruiser)).to include(String)
    end
  end

  describe '#check_main_menu_input' do
    it 'can check whether the player put p or q, and responds correctly' do
      turn = Turn.new("Player", "p")
      msg = Message.new

      expect(turn.check_main_menu_input).to eq(msg.setup_msg)

      turn = Turn.new("Player", "q")

      expect(turn.check_main_menu_input).to eq(false)
    end
  end

  describe '#check_player_coordinates_for_ship' do
    it 'can check if the player coordinates are valid' do
      player_turn = Turn.new("Player", "A1, A2, A3")
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)  

      expect(player_turn.check_player_coordinates(cruiser)).to eq(true)
      expect(player_turn.check_player_coordinates(submarine)).to eq(false)

      player_turn = Turn.new("Player", "A1, B1, C1")

      expect(player_turn.check_player_coordinates(cruiser)).to eq(true)

      player_turn = Turn.new("Player", "A1, B2, C3")

      expect(player_turn.check_player_coordinates(cruiser)).to eq(false)
    end
  end

  describe '#place_player_ship' do
    it 'can place the cruiser once the player coordinates chosen are valid' do
      player_turn = Turn.new("Player", "A1, B1, C1")
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)  
      player_turn.place_player_ship(cruiser)
      cells_with_ship = 0
    
      player_turn.board.cells.values.each do |cell|
        cell.ship != nil ? cells_with_ship += 1 : false
      end
      expect(cells_with_ship).to eq(3)

      player_turn = Turn.new("Player", "A1, B1")
      cells_with_ship = 0
      player_turn.place_player_ship(submarine)
      player_turn.board.cells.values.each do |cell|
        cell.ship != nil ? cells_with_ship += 1 : false
      end
      expect(cells_with_ship).to eq(2)
    end
  end

  describe '#computer_shot' do
    it 'randomizes the computers shot' do
      player_board = Turn.new("Player")
      player_board.computer_shot
      computer_shots = 0
      player_board.board.cells.values.each do |cell|
        if cell.shots_fired > 0
          computer_shots += 1
        end
      end
      expect(computer_shots).to eq(1)

      player_board.computer_shot
      player_board.computer_shot
      player_board.computer_shot
      computer_shots = 0
      player_board.board.cells.values.each do |cell|
        if cell.shots_fired > 0
          computer_shots += 1
        end
      end

      expect(computer_shots).to eq(4)
    end
  end

  describe '#valid_shot?' do
    it 'can validate whether the cell has been fired upon or not' do
      player_turn = Turn.new("Player")

      expect(player_turn.valid_shot?("C1")).to eq(true)
    end
  end

  describe 'shot_results' do
    it 'can check the cell to see what kind of shot was made, and translate to String accordingly' do
      player_turn = Turn.new("Player")

      expect(player_turn.shot_results("M")).to eq("miss")
      expect(player_turn.shot_results("X")).to eq("sink")
      expect(player_turn.shot_results("H")).to eq("hit")
      expect(player_turn.shot_results(".")).to eq("There's an error, try again.")
    end
  end
end