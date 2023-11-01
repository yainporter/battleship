require './spec/spec_helper'

RSpec.describe Game do
  
  describe '#initialize' do
    it 'has a hash of @turns, @cruiser, @submarine, and @msg' do
      game = Game.new

      expect(game).to be_a(Game)
      expect(game.turns).to be_a(Hash)
      expect(game.turns["Player"]).to be_a(Turn)
      expect(game.ships).to be_a(Hash)
      expect(game.ships[:player_submarine]).to be_a(Ship)
      expect(game.msg).to be_a(Message)
    end
  end

  describe '#main menu' do
    it 'prints out the main menu message' do
      game = Game.new
    end
  end

  describe '#game_set_up' do
    it 'sets up the board' do
      game = Game.new
      game.play
    end
  end
  
end