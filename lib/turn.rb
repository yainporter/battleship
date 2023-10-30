class Turn
  attr_reader :battleship

  def initialize
    @battleship = Battleship.new
  end
end