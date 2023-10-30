require './spec/spec_helper'

RSpec.describe Turn do
  describe '#initialize' do
    it 'has @battleship' do
      game_turns = Turn.new

      expect(game_turns.battleship).to be_a(Battleship)
    end
  end

  describe '#board_text' do
    it 'can display the boarder for the boards' do
      game_turns = Turn.new

      expect(game_turns.board_text("computer")).to eq("=============COMPUTER BOARD=============")
      expect(game_turns.board_text("player")).to eq("==============PLAYER BOARD==============")
      expect(game_turns.board_text("SFSDFSD")).to eq("Try again, please.")
    end
  end

  describe '#display_board' do
    it 'can display the computer board' do
      turns = Turn.new
      computer_game = Battleship.new

      expect(turns.display_board(computer_game)).to eq(computer_game.board.render)
    end

    it 'can display the players board' do
      turns = Turn.new
      player_game = Battleship.new

      expect(turns.display_board(player_game)).to eq(player_game.board.render)
    end
  end

end