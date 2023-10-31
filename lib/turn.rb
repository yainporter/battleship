require 'Message'
class Turn
  attr_reader :name, :check_player_input, :board

  def initialize(name, test_player_input = nil)
    @name = name
    @board = Board.new
    @check_player_input = test_player_input
  end
############################ GAME SETUP ##############################

  def player_response
    @check_player_input = gets.chomp
  end

  def check_main_menu_input
    msg = Message.new
    
    if @check_player_input == "p" 
      msg.setup_msg
    else
      msg.exit_msg
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
########################### PLAYER SHOT ###################################

  def valid_shot?(coordinate)
    true_or_false = false
    board.cells.values.each do |cell|
      if cell.shots_fired == 0
        true_or_false = true
      end
    end
    true_or_false
  end

  def computer_shot 
    coordinate = @board.cells.keys.sample
    if valid_shot?(coordinate)
      board.cells[coordinate].fire_upon
      results = board.cells[coordinate].render
      results = shot_results(results)
    end
    "My shot on #{coordinate} was a #{results}."
  end

  def player_shot
    if valid_shot?(check_player_input) == false
      "Please enter a valid coordinate:"
    else
      board.cells[check_player_input].fire_upon
      results = board.cells[check_player_input].render
      results = shot_results(results)
    end
    "Your shot on #{check_player_input} was a #{results}."
  end

  def shot_results(results)
    case results
    when "M"
      "miss"
    when "X"
      "sink"
    when "H"
      "hit"
    else
      "ERROR, try again."
    end
  end
end
# battleship = Battleship.new
# battleship.main_menu