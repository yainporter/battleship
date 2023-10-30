require './spec/spec_helper'
class Battleship
  attr_reader :check_player_input, :board

  def initialize(test_player_input = nil)
    @board = Board.new
    @check_player_input = test_player_input
  end
############################ GAME SETUP ##############################

  def main_menu
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def player_response
    @check_player_input = gets.chomp
    @check_player_input == "q" ? exit : false
  end

  def ship_message(ship)
    if ship == "cruiser"
      "Enter the squares for the Cruiser (3 spaces):\n >" 
    elsif ship == "submarine"    
      "Enter the squares for the Submarine(2 spaces):\n > "
    else 
      "Error, try again"
    end
  end


  def check_main_menu_input
    if @check_player_input == "p" 
      puts setup_msg
    else
      "OK, thanks for playing!"
    end
  end

  def check_player_coordinates(ship)
    if @board.valid_placement?(ship, @check_player_input.gsub(",","").split) 
      true
    end
  end

  def place_player_ship(ship)
    @board.place(ship, @check_player_input.gsub(",","").split) 
  end
###################### PRIVATE METHODS ###################

  def cruiser
    cruiser = Ship.new("Cruiser", 3)
  end

  def submarine
    submarine = Ship.new("Submarine", 2)
  end

  def random_coordinate(n)
    n == 2 ? ship = submarine : ship = cruiser
    sample = @board.cells.keys.sample(n)
    until @board.valid_placement?(ship, sample)
      sample = @board.cells.keys.sample(n)
    end
    sample
  end

  def computer_setup
    @board.place(cruiser, random_coordinate(3))
    @board.place(submarine, random_coordinate(2))
  end

  def invalid_coordinates_msg
    "Those are invalid coordinates. Please try again:\n >"
  end

  def exit
    "Thanks for playing, see you soon."
  end

  def setup_msg
    "I have laid out my ships on the grid.\n You now need to lay out your two ships.\n The Cruiser is three units long and the Submarine is two units long.\n"
  end

  def loop_for_player_coordinates(ship)
    placement_check = false
    until placement_check == true
      player_response
      if check_player_coordinates(ship) == true 
        placement_check = true 
      elsif placement_check == false
        puts invalid_coordinates_msg
      else
        "ERROR"
      end
    end
  end

end


# battleship = Battleship.new
# battleship.main_menu