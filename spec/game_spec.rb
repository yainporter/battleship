require './spec/spec_helper'

RSpec.describe Game do
  describe '#initialize' do
    it 'has @turns' do
      game = Game.new

      
    end
  end

  describe '#board_text' do
    it 'can display the boarder for the boards' do
      game = Game.new

      expect(game.board_text("computer")).to eq("=============COMPUTER BOARD=============")
      expect(game.board_text("player")).to eq("==============PLAYER BOARD==============")
      expect(game.board_text("SFSDFSD")).to eq("Try again, please.")
    end
  end

end