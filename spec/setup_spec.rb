require './spec/spec_helper'

RSpec.descrive Setup do
  describe '#initialize' do
    it 'has @battleship' do
      game_setup = Setup.new

      expect(game_setup.battleship).to be_a(Battleship)
    end
  end

  describe '#start' do
    it 'can print out the main menu for Battleship' do
      game_setup = Setup.new
      
    end
  end
end