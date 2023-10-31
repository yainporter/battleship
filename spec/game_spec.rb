require './spec/spec_helper'

RSpec.describe Game do
  describe '#initialize' do
    it 'has @turns' do
      games = Game.new

      expect(games.turns).to be_a(Turn)
    end
  end

  describe '#board_text' do
    it 'can display the boarder for the boards' do
      games = Game.new

      expect(games.board_text("computer")).to eq("=============COMPUTER BOARD=============")
      expect(games.board_text("player")).to eq("==============PLAYER BOARD==============")
      expect(games.board_text("SFSDFSD")).to eq("Try again, please.")
    end
  end

  describe '#display_board' do
    it 'can display the computer board' do
      Games = Game.new
      computer_game = Turn.new

      expect(Games.display_board(computer_game)).to eq(computer_game.board.render)
    end

    it 'can display the players board' do
      Games = Game.new
      player_game = Turn.new

      expect(Games.display_board(player_game)).to eq(player_game.board.render)
    end
  end

end