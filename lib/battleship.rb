require './spec/spec_helper'
class Battleship
  attr_reader :check_player_input, :board

  def initialize(test_player_input = nil)
    @board = Board.new
    @check_player_input = test_player_input
  end

  def main_menu
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def player_response
    @check_player_input = gets.chomp
  end

  def setup
      computer_setup
      "I have laid out my ships on the grid.\n
      You now need to lay out your two ships.\n
      The Cruiser is three units long and the Submarine is two units long.\n
        1 2 3 4\n
      A . . . .\n
      B . . . .\n
      C . . . .\n
      D . . . .\n"
  end

  def cruiser_message
    "Enter the squares for the Cruiser (3 spaces):\n >"
  end

  def submarine_message
    "Enter the squares for the Submarine(2 spaces):\n > "
  end

  def check_main_menu_input
    if @check_player_input == "p" 
      puts setup 
    else
      "OK, thanks for playing!"
    end
  end

  def check_player_coordinates_for_cruiser

    if @board.valid_placement?(ships[0], @check_player_input.gsub(",","").split) 
      @board.place(ships[0], @check_player_input.gsub(",","").split) 
      true
    else
      invalid_coordinates_msg
    end
  end

###################### PRIVATE METHODS ###################
  

  def ships
    [cruiser = Ship.new("Cruiser", 3),
    submarine = Ship.new("Submarine", 2)]
  end

  def random_coordinate(n)
    n == 2 ? ship = ships[1] : ship = ships[0]
    sample = @board.cells.keys.sample(n)
    until @board.valid_placement?(ship, sample)
      sample = @board.cells.keys.sample(n)
    end
    sample
  end

  def computer_setup
    @board.place(ships[0], random_coordinate(3))
    @board.place(ships[1], random_coordinate(2))
  end

  def invalid_coordinates_msg
    "Those are invalid coordinates. Please try again:\n >"
  end
end
# battleship = Battleship.new
# battleship.main_menu