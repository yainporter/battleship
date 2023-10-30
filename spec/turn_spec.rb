require './spec/spec_helper'

RSpec.describe Turn do
  describe '#initialize' do
    it 'has @battleship' do
      game_turns = Turn.new

      expect(game_setup.battleship).to be_a(Battleship)
    end

    describe '#board_text' do
      it 'can display the boarder for the boards' do
        game_turns = Turn.new

        expect(game_turns.board_text(computer)).to eq("=============COMPUTER BOARD=============")
        expect(game_turns.board_text(player)).to eq("==============PLAYER BOARD==============")
      end
    end

    describe '#display_board' do
      it 'can display the computer board' do
        turns = Turn.new
        
        expect(turns.display_board(computer)).to eq()
      end

      it 'can display the players board' do
        turns = Turn.new

        expect(turns.display_board(player)).to eq()
      end
    end
  end


end