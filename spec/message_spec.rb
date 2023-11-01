require './spec/spec_helper'

RSpec.describe Message do
  describe 'initialize' do
    it 'can create Message' do
      game_msg = Message.new

      expect(game_msg).to be_a(Message)
    end
  end

  describe '#main_menu' do
    it 'can print the #main_menu welcome message' do
    msg = Message.new

    expect(msg.main_menu_msg).to eq(    "Welcome to BATTLESHIP\n
    Are you ready to go to war?\n
    Enter f to fight or q to quit.")
    end
  end

  describe 'setup_msg' do
    it 'directs the player what to do after setting the computers board' do
    msg = Message.new

    expect(msg.setup_msg).to eq("I have set my ships to sea.\n Now you must set your ships to sea.\n The Cruiser is three units long and the Submarine is two units long.\n")
    end
  end

  describe '#ship_message' do
    it 'generates a prompt for the user to place their cruiser or submarine' do
      msg = Message.new

      expect(msg.ship_msg("Cruiser")).to eq("Enter 3 squares for your Cruiser:")
      expect(msg.ship_msg("Submarine")).to eq("Enter 2 squares for your Submarine:")
      expect(msg.ship_msg("ship")).to eq("You entered it wrong, make sure the first letter of the ship is capitalized.")
    end
  end

  describe '#invalid_coordinates' do
    it 'can tell the user that their coordinates are invalid, and prompt them to try again' do
      msg = Message.new

      expect(msg.invalid_coordinates_msg).to eq("That's the wrong ocean. Please try again.")
    end
  end

  describe '#board_header_msg' do
    it 'can display the boarder for the boards' do
      msg = Message.new

      expect(msg.board_header_msg("Enemy")).to eq("=============ENEMY BOARD=============")
      expect(msg.board_header_msg("Homeland")).to eq("==============HOMELAND BOARD==============")
      expect(msg.board_header_msg("SFSDFSD")).to eq("Try again, please.")
    end
  end

  describe '#player_shot_prompt' do
  it 'prompts the user to enter a coordinate for their shot ' do
    msg = Message.new
    
    expect(msg.player_shot_prompt_msg).to eq("Enter the coordinate for your shot and we will load the missle:")
  end
end

  describe 'exit' do
    it 'can end the turn game' do
      msg = Message.new

      expect(msg.exit_msg).to eq("Your country thanks you, see you soon.")
    end
  end

  describe '#you_lose_msg' do
    it 'tells the player their ships have sunk' do
      msg = Message.new

      expect(msg.you_lose_msg).to eq(    "All of your ships have been sunk, you lose!")
    end
  end

  describe '#computer_loses_msg' do
    it 'tells the player all the enemy ships have sunk' do
      msg = Message.new

      expect(msg.computer_loses_msg).to eq ("All of the enemy ships have been sunk, the Homeland has won!")
    end
  end

  describe '#next_round_msg' do
    it 'informs of next round' do
      msg = Message.new

      expect(msg.next_round_msg).to eq("Next round!")
    end
  end


end