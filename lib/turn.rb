require 'Message'
class Turn
  attr_reader :name, :check_player_input, :board

  def initialize(name, test_player_input = nil)
    @name = name
    @board = Board.new
    @check_player_input = test_player_input
    @msg = Message.new
  end
############################ PLAYER INPUTS ##############################

  def player_response
    @check_player_input = gets.chomp
  end

  def check_main_menu_input
    @check_player_input == "p" ? @msg.setup_msg : @msg.exit_msg 
  end

  def check_player_coordinates(ship)
    if @board.valid_placement?(ship, @check_player_input.gsub(",","").split) && @board.valid_coordinate?(@check_player_input.gsub(",","").split) 
      true
    else 
      false
    end
  end


  # def check_player_input_count(ship)
  #   until @check_player_input.split.count == ship.length 
  #   @msg.invalid_coordinates_msg
  #   player_response
  #   end
  # end

  def place_player_ship(ship)
    @board.place(ship, @check_player_input.gsub(",","").split) 
  end

  def player_shot
    if valid_shot?(check_player_input) == false
      @msg.invalid_coordinates_msg
    else
      board.cells[check_player_input].fire_upon
      results = board.cells[check_player_input].render
      results = shot_results(results)
    end
    "Your shot on #{check_player_input} was a #{results}."
  end

  def loop_for_player_coordinates(ship)
    placement_check = false
    until placement_check == true
      puts @msg.ship_msg(ship.name).chomp
      player_response
      if check_player_coordinates(ship) == true 
        placement_check = true 
        puts @msg.valid_entry_msg
      else
        puts @msg.invalid_coordinates_msg
      end
    end
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
###################### COMPUTER METHODS ###################
  def random_coordinate(ship)
    sample = @board.cells.keys.sample(ship.length)
    until @board.valid_placement?(ship, sample)
      sample = @board.cells.keys.sample(ship.length)
    end
    sample
  end

  def valid_shot?(coordinate)
    board.cells[coordinate].shots_fired == 0 ? true : false 
  end

  def computer_setup(cruiser, submarine)
    @board.place(cruiser, random_coordinate(cruiser))
    @board.place(submarine, random_coordinate(submarine))
  end

  def computer_shot
    coordinate = @board.cells.keys.sample
    until valid_shot?(coordinate)
      coordinate = @board.cells.keys.sample
    end
    board.cells[coordinate].fire_upon
    results = board.cells[coordinate].render
    results = shot_results(results)
    "My shot on #{coordinate} was a #{results}."
  end
end