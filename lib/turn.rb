
require './lib/message'
class Turn
  attr_reader :name, :check_player_input, :board

  def initialize(name, test_player_input = nil)
    @name = name
    @board = Board.new
    @check_player_input = test_player_input
    @msg = Message.new
    @quit_count = 0
  end
############################ PLAYER INPUTS ##############################

  def player_response
    @check_player_input = gets.chomp.upcase
    # $stdin.gets("\n")
    quit?
  end


  #This is not implemented correctly yet
  def quit?
    if @check_player_input == "q" && quit_count == 0
      puts @msg.exit_msg 
      @quit_count += 1
      true 
    elsif check_player_input == "q" 
      true
    else
      false
    end
  end

  def check_main_menu_input
    if quit?
      false
    elsif @check_player_input == "p" 
      @msg.setup_msg
    else
      @msg.error_msg
    end
  end

  def check_player_coordinates(ship)
    if quit?
      false
    elsif @board.valid_placement?(ship, @check_player_input.gsub(",","").split) && @board.valid_coordinate?(@check_player_input.gsub(",","").split) 
      true
    else 
      false
    end
  end

  # Didn't end up using this method for some reason
  # def check_player_input_count(ship)
  #   until @check_player_input.split.count == ship.length 
  #   @msg.invalid_coordinates_msg
  #   player_response
  #   end
  # end

  def place_player_ship(ship)
    if quit?  
      false
    else 
      @board.place(ship, @check_player_input.gsub(",","").split) 
    end
  end

  ## NOT TESTED DUE TO GETS
  def player_shot
    if valid_shot?(@check_player_input)
      @board.cells[@check_player_input].fire_upon
      results = board.cells[@check_player_input].render
      results = shot_results(results)
    else
      @msg.error_msg
    end
    "Your shot on #{@check_player_input} was a #{results}."
  end


  ## NOT TESTED DUE TO GETS
  def loop_for_player_coordinates(ship)
    placement_check = false
    until placement_check == true
      player_response
      if check_player_coordinates(ship) == true 
        placement_check = true 
      elsif placement_check == false
        puts @msg.invalid_coordinates_msg
        puts @board.render(true)
      else
        "ERROR, TRY AGAIN"
      end
    end
  end

  ## NOT TESTED DUE TO GETS
  def valid_shot?(coordinate)
    coordinate = coordinate
    if @board.valid_cell?(coordinate) == nil
      puts @msg.invalid_coordinates_msg
      player_response
      player_shot
    elsif @board.valid_cell?(coordinate)
      true
    else
      puts @msg.pick_another_coordinate_msg
      player_response
      player_shot
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
      "There's an error, try again."
    end
  end

  def quit_count
    @quit_count
  end
##################### COMPUTER METHODS ###################
  def random_coordinate(ship)
    sample = @board.cells.keys.sample(ship.length)
    until @board.valid_placement?(ship, sample)
      sample = @board.cells.keys.sample(ship.length)
    end
    sample
  end

  def computer_valid_shot?(coordinate)
    true if @board.valid_cell?(coordinate)
  end

  def computer_setup(cruiser, submarine)
    @board.place(cruiser, random_coordinate(cruiser))
    @board.place(submarine, random_coordinate(submarine))
  end

  def computer_shot
    coordinate = @board.cells.keys.sample
    until computer_valid_shot?(coordinate)
      coordinate = @board.cells.keys.sample
    end
    @board.cells[coordinate].fire_upon
    results = board.cells[coordinate].render
    results = shot_results(results)
    "My shot on #{coordinate} was a #{results}."
  end
end