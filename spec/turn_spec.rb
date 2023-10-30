require './spec/spec_helper'

RSpec.descrive Turn do
  describe '#initialize' do
    it 'has @battleship' do
      game_turns = Turn.new

      expect(game_setup.battleship).to be_a(Battleship)
    end

    def display_board do
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