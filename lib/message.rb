class Message

  def initialize
  end

  def main_menu_msg
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def setup_msg
    "I have laid out my ships on the grid.\n You now need to lay out your two ships.\n The Cruiser is three units long and the Submarine is two units long.\n"
  end

  def ship_msg(ship)
    if ship == "cruiser"
      "Enter the squares for the Cruiser (3 spaces):\n >" 
    elsif ship == "submarine"    
      "Enter the squares for the Submarine(2 spaces):\n > "
    else 
      "Error, try again"
    end
  end

  def invalid_coordinates_msg
    "Those are invalid coordinates. Please try again:\n >"
  end

  def board_header_msg(player_or_computer)
    if player_or_computer == "computer"
      "=============COMPUTER BOARD============="
    elsif player_or_computer == "player"
      "==============PLAYER BOARD=============="
    else
      "Try again, please."
    end
  end
  
    def player_shot_prompt_msg
    "Enter the coordinate for your shot:"
  end

  def exit_msg
    "Thanks for playing, see you soon."
  end
end