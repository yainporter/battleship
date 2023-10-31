require './spec/spec_help'

RSpec.describe Message do
  describe 'initialize' do
    it 'can create Message' do
      game_msg = Message.new

      expect(game_msg).to be_a(Message)
    end
  end

  describe '#main_menu' do
    it 'can print the #main_menu welcome message' do
    game_msg = Message.new

      (game_msg.main_menu).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
    end
  end

#   describe 'setup_msg' do
#     it 'directs the player what to do after setting the computers board' do
#     player_turn = Turn.new("Player")

#     expect(player_turn_game.setup_msg).to eq("I have laid out my ships on the grid.\n You now need to lay out your two ships.\n The Cruiser is three units long and the Submarine is two units long.\n")
#     #   1 2 3 4\n
#     # A . . . .\n
#     # B . . . .\n
#     # C . . . .\n
#     # D . . . .\n")
#     end
#   end

#   describe '#ship_message' do
#     it 'generates a prompt for the user to place their cruiser or submarine' do
#       player_turn = Turn.new("Player")

#       expect(player_turn_game.ship_message("cruiser")).to eq("Enter the squares for the Cruiser (3 spaces):\n >")
#       expect(player_turn_game.ship_message("submarine")).to eq("Enter the squares for the Submarine(2 spaces):\n > ")
#       expect(player_turn_game.ship_message("ship")).to eq("Error, try again")
#     end
#   end

#   describe '#invalid_coordinates' do
#     it 'can tell the user that their coordinates are invalid, and prompt them to try again' do
#       player_turn = Turn.new("Player", "A1, B2, C3") 

#       expect(player_turn_game.invalid_coordinates_msg).to eq("Those are invalid coordinates. Please try again:\n >")
#     end
#   end

#   describe 'exit' do
#     it 'can end the turn game' do
#       player_turn = Turn.new("Player")
#       expect(player_turn_game.exit).to eq("Thanks for playing, see you soon.")
#     end
#   end
end