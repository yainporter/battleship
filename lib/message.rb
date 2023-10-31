class Message

  def main_menu_msg
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def setup_msg
    "I have laid out my ships on the grid.\n You now need to lay out your two ships.\n The Cruiser is three units long and the Submarine is two units long.\n"
  end

  def ship_msg(ship)
    if ship == "Cruiser"
      "Enter the squares for the Cruiser (3 spaces):" 
    elsif ship == "Submarine"    
      "Enter the squares for the Submarine(2 spaces):"
    else 
      "You entered it wrong, make sure the first letter of the ship is capitalized."
    end
  end

  def invalid_coordinates_msg
    "Those are invalid coordinates. Please try again."
  end

  def board_header_msg(player_or_computer)
    if player_or_computer == "Computer"
      "=============COMPUTER BOARD============="
    elsif player_or_computer == "Player"
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