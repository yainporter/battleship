class Battleship
  attr_reader :player_input, :board

  def initialize
    @board = Board.new
    @player_input = nil
  end

  def main_menu
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def player_response
    @player_input = gets
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
    "Enter the squares for the Cruiser (3 spaces): "
  end

  def submarine_message
    "Enter the squares for the Submarine(2 spaces): "
  end

  def player_setup
    @player_response
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

  def player_setup

  end
end
# battleship = Battleship.new
# battleship.main_menu