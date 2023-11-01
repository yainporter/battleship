class Game
  attr_reader :turns, :ships, :msg

  def initialize
    @turns = turns
    @ships = ships
    @msg = Message.new
    @quit_count = 0
    @boards = boards
  end

  def boards
    @boards = {"Player" => @turns["Player"].board, "Computer" => @turns["Computer"].board}
  end

  def turns
    @turns = {"Player" => Turn.new("Player"), "Computer" => Turn.new("Computer")}
  end

  def ships
    @ships = {player_cruiser: Ship.new("Cruiser", 3), player_submarine: Ship.new("Submarine", 2), computer_cruiser: Ship.new("Cruiser", 3), computer_submarine: Ship.new("Submarine", 2)}
  end

  def main_menu
    puts msg.main_menu_msg
    @turns["Player"].player_response
    @turns["Player"].check_main_menu_input
  end

  def set_up
      @turns["Computer"].computer_setup(@ships[:computer_cruiser], @ships[:computer_submarine])
      puts @boards["Player"].render
      puts @msg.ship_msg("Cruiser")
      @turns["Player"].loop_for_player_coordinates(@ships[:player_cruiser])
      @turns["Player"].place_player_ship(@ships[:player_cruiser])
      puts @boards["Player"].render(true)
      puts @msg.ship_msg("Submarine")
      @turns["Player"].loop_for_player_coordinates(@ships[:player_submarine])
      @turns["Player"].place_player_ship(@ships[:player_submarine])

      puts @msg.board_header_msg("Computer")
      puts @boards["Computer"].render
      puts @msg.board_header_msg("Player")
      puts @boards["Player"].render(true)
  end

  def game_rounds
    until sunk_ships?
      puts @msg.player_shot_prompt_msg
      @turns["Computer"].player_response
      if game_quit?
        break
      end
      puts @turns["Player"].computer_shot
      puts @turns["Computer"].player_shot
      puts @msg.board_header_msg("Computer")
      puts @boards["Computer"].render
      puts @msg.board_header_msg("Player")
      puts @boards["Player"].render(true)
    end
  end

  def sunk_ships?
    if @ships[:player_cruiser].sunk? && @ships[:player_submarine].sunk?
      puts @msg.you_lose
      true
    elsif @ships[:computer_cruiser].sunk? && @ships[:computer_submarine].sunk?
      puts @msg.computer_loses_msg
      true
    else
      puts @msg.next_round_msg
      false
    end
  end


  def play
    until @turns["Player"].quit? || @turns["Computer"].quit?
      main_menu
      break if @turns["Player"].quit? || @turns["Computer"].quit?
      set_up
      break if @turns["Player"].quit? || @turns["Computer"].quit?
      game_rounds
      break if @turns["Player"].quit? || @turns["Computer"].quit?
    end
  end

  def game_quit?
    if player_quit? && quit_count?
      @msg.exit_msg
    elsif player_quit?
      true
    else
      false
    end
  end

  def player_quit?
    @turns["Player"].quit? || @turns["Computer"].quit?
  end

  def quit_count?
    @turns["Player"].quit_count == 1 || @turns["Computer"].quit_count == 1
  end
end