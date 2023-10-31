require './spec/spec_helper'

RSpec.describe Turn do
  describe '#initialize' do
    it 'can initialize the game with @player_input, and @board' do
      player_turn = Turn.new("Player")
      expect(player_turn = Turn.new).to be_a(Turn)
      expect(player_turn.check_player_input).to eq(nil)
      expect(player_turn.board).to be_a(Board)
      expect(player_turn.name).to eq("Player")
    end

    it 'has the option to pass in a parameter for @check_player_input' do
      player_turn = Turn.new("p")

      expect(player_turn.check_player_input).to eq("p")
    end
  end

  describe '#main_menu' do
    it 'can print the #main_menu welcome message' do
      player_turn = Turn.new("Player")

      expect(player_turn.main_menu).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
    end
  end

  describe '#setup' do

    it 'has a #computer_setup helper method that lays out the board for the computer' do
      player_turn = Turn.new("Player")
      turn_game.computer_setup

      expect(player_turn_game.board.cells.values.select{|cell| cell.empty? == false}.count).to eq(5)
      turn_game.board.cells.values.each do |cell|
        expect(cell).to be_a(Cell)
      end
    end

    it 'directs the player what to do after setting the computers board' do
      player_turn = Turn.new("Player")

      expect(player_turn_game.setup_msg).to eq("I have laid out my ships on the grid.\n You now need to lay out your two ships.\n The Cruiser is three units long and the Submarine is two units long.\n")
      #   1 2 3 4\n
      # A . . . .\n
      # B . . . .\n
      # C . . . .\n
      # D . . . .\n")
    end
  end

  describe '#random_coordinate' do
    it 'generate a random coordinate from an Array of coordinates and generate an Array of random coordinates when an argument is given' do
      player_turn = Turn.new("Player")

      expect(player_turn_game.random_coordinate(3).count).to be(3)
      expect(player_turn_game.random_coordinate(2).count).to be(2)
      expect(player_turn_game.random_coordinate(3)).to include(String)
    end
  end

  describe '#ship_message' do
    it 'generates a prompt for the user to place their cruiser or submarine' do
      player_turn = Turn.new("Player")

      expect(player_turn_game.ship_message("cruiser")).to eq("Enter the squares for the Cruiser (3 spaces):\n >")
      expect(player_turn_game.ship_message("submarine")).to eq("Enter the squares for the Submarine(2 spaces):\n > ")
      expect(player_turn_game.ship_message("ship")).to eq("Error, try again")
    end
  end

  describe '#check_main_menu' do
    it 'can check whether the player put p or q, and responds correctly' do
      turn = Turn.new("p")

      expect(player_turn.check_main_menu_input).to eq(nil)

      turn = Turn.new("1")

      expect(player_turn.check_main_menu_input).to eq("OK, thanks for playing!")
    end
  end

  describe '#player_setup' do
    it 'can check to see if the player_input is valid' do
      player_turn = Turn.new("Player")

      # expect(player_setup).to eq("Enter the squares for the Submarine (2 spaces):")
    end
  end

  describe '#check_player_coordinates_for_ship' do
    it 'can check if the player coordinates are valid' do
      player_turn = Turn.new("Player", "A1, A2, A3")
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)  

      expect(player_turn_game.check_player_coordinates(cruiser)).to eq(true)
      expect(player_turn_game.check_player_coordinates(submarine)).to eq(nil)

      player_turn = Turn.new("Player", "A1, B1, C1")

      expect(player_turn_game.check_player_coordinates(cruiser)).to eq(true)

      player_turn = Turn.new("Player", "A1, B2, C3")

      expect(player_turn_game.check_player_coordinates(cruiser)).to eq(nil)
    end
  end

  describe '#invalid_coordinates' do
    it 'can tell the user that their coordinates are invalid, and prompt them to try again' do
      player_turn = Turn.new("Player", "A1, B2, C3") 

      expect(player_turn_game.invalid_coordinates_msg).to eq("Those are invalid coordinates. Please try again:\n >")
    end
  end

  describe '#place_player_cruiser' do
    it 'can place the cruiser once the player coordinates chosen are valid' do
      player_turn = Turn.new("Player", "A1, B1, C1")
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)  
      turn_game.place_player_ship(cruiser)
      cells_with_ship = 0
    
      turn_game.board.cells.values.each do |cell|
        cell.ship != nil ? cells_with_ship += 1 : false
      end
      expect(cells_with_ship).to eq(3)

      player_turn = Turn.new("Player", "A1, B1")
      cells_with_ship = 0
      turn_game.place_player_ship(submarine)
      turn_game.board.cells.values.each do |cell|
        cell.ship != nil ? cells_with_ship += 1 : false
      end
      expect(cells_with_ship).to eq(2)
    end
  end

  describe '#cruiser' do
    it 'can create a cruiser ship' do
      player_turn = Turn.new("Player")

      expect(player_turn_game.cruiser).to be_a(Ship)
      expect(player_turn_game.cruiser.name).to eq("Cruiser")
    end
  end

  describe '#submarine' do
    it 'can create a submarine ship' do
      player_turn = Turn.new("Player")

      expect(player_turn_game.submarine).to be_a(Ship)
      expect(player_turn_game.submarine.name).to eq("Submarine")
    end
  end

  describe 'exit' do
    it 'can end the turn game' do
      player_turn = Turn.new("Player")
      expect(player_turn_game.exit).to eq("Thanks for playing, see you soon.")
    end
  end

  describe '#player_shot_prompt' do
    it 'prompts the user to enter a coordinate for their shot ' do
      player_turn = Turn.new("Player")
      
      expect(player_turn_game.player_shot_prompt).to eq("Enter the coordinate for your shot:")
    end
  end

  describe '#computer_shot' do
    it 'randomizes the computers shot' do
      player_board = Turn.new
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

      expect(player_turn_game.valid_shot?("C1")).to eq(true)
    end
  end

  # describe 'player_shot' do
  #   it 'lets the player take a shot at the computers board' do
  #   computer_board = Turn.new
  #   computer_board.player_response
  #   computer_board.player_shot
  #   computer_shots = 0
  #   player_board.board.cells.values.each do |cell|
  #     if cell.shots_fired > 0
  #       computer_shots += 1
  #     end
  #   end
  #   expect(computer_shots).to eq(1)
  # end

  describe 'shot_results' do
    it 'can check the cell to see what kind of shot was made, and translate to String accordingly' do
      player_turn = Turn.new("Player")

      expect(player_turn_game.shot_results("M")).to eq("miss")
      expect(player_turn_game.shot_results("X")).to eq("sink")
      expect(player_turn_game.shot_results("H")).to eq("hit")
      expect(player_turn_game.shot_results(".")).to eq("ERROR, try again.")
    end
  end
end