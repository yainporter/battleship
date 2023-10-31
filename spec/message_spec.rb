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

      expect(msg.main_menu_msg).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
    end
  end

  describe 'setup_msg' do
    it 'directs the player what to do after setting the computers board' do
    msg = Message.new

    expect(msg.setup_msg).to eq("I have laid out my ships on the grid.\n You now need to lay out your two ships.\n The Cruiser is three units long and the Submarine is two units long.\n")
    end
  end

  describe '#ship_message' do
    it 'generates a prompt for the user to place their cruiser or submarine' do
      msg = Message.new

      expect(msg.ship_msg("cruiser")).to eq("Enter the squares for the Cruiser (3 spaces):\n >")
      expect(msg.ship_msg("submarine")).to eq("Enter the squares for the Submarine(2 spaces):\n > ")
      expect(msg.ship_msg("ship")).to eq("Error, try again")
    end
  end

  describe '#invalid_coordinates' do
    it 'can tell the user that their coordinates are invalid, and prompt them to try again' do
      msg = Message.new

      expect(msg.invalid_coordinates_msg).to eq("Those are invalid coordinates. Please try again:\n >")
    end
  end

  describe '#board_header_msg' do
    it 'can display the boarder for the boards' do
      msg = Message.new

      expect(msg.board_header_msg("computer")).to eq("=============COMPUTER BOARD=============")
      expect(msg.board_header_msg("player")).to eq("==============PLAYER BOARD==============")
      expect(msg.board_header_msg("SFSDFSD")).to eq("Try again, please.")
    end
  end

  describe '#player_shot_prompt' do
  it 'prompts the user to enter a coordinate for their shot ' do
    msg = Message.new
    
    expect(msg.player_shot_prompt_msg).to eq("Enter the coordinate for your shot:")
  end
end

  describe 'exit' do
    it 'can end the turn game' do
      msg = Message.new

      expect(msg.exit_msg).to eq("Thanks for playing, see you soon.")
    end
  end
end