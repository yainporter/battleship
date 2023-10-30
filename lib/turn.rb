class Turn
  attr_reader :battleship

  def initialize
    @battleship = Battleship.new
  end

  def board_text(player_or_computer)
    if player_or_computer == "computer"
      "=============COMPUTER BOARD============="
    elsif player_or_computer == "player"
      "==============PLAYER BOARD=============="
    else
      "Try again, please."
    end
  end

  def display_board
    
  end
end