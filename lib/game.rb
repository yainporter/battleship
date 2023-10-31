class Game
  attr_reader :turns

  def initialize
    @turns = [Turn.new("Player"), Turn.new("Computer")]
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


end