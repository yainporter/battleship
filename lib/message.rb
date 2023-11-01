class Message

  def main_menu_msg
    "Welcome to BATTLESHIP\n
    Are you ready to go to war?\n
    Enter f to fight or q to quit."
  end

  def setup_msg
    "I have set my ships to sea.\n Now you must set your ships to sea.\n The Cruiser is three units long and the Submarine is two units long.\n"
  end

  def ship_msg(ship)
    if ship == "Cruiser"
      "Enter 3 squares for your Cruiser:" 
    elsif ship == "Submarine"    
      "Enter 2 squares for your Submarine:"
    else 
      "You entered it wrong, make sure the first letter of the ship is capitalized."
    end
  end

  def valid_entry_msg
    "Your entry was valid, thank you."
  end


  def invalid_coordinates_msg
    "That's the wrong ocean. Please try again."
  end

  def board_header_msg(player_or_computer)
    if player_or_computer == "Enemy"
      "=============ENEMY BOARD============="
    elsif player_or_computer == "HOMELAND"
      "==============HOMELAND BOARD=============="
    else
      "Try again, please."
    end
  end
  
    def player_shot_prompt_msg
    "Enter the coordinate for your shot and we will load the missle:"
  end

  def exit_msg
    "Your country thanks you, see you soon."
  end

  def you_lose_msg
    "All of your ships have been sunk, you lose!"
  end

  def computer_loses_msg
    "All of the enemy ships have been sunk, the Homeland has won!"
  end

  def next_round_msg
    "Next round!"
  end

  def pick_another_coordinate_msg
    "You've already fired there! Hurry, pick another one!"
  end

  def error_msg
    "There's an error, try again."
  end
end