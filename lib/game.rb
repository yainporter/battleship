class Game
  attr_reader :turns, :ships, :msg

  def initialize
    @turns = turns
    @ships = ships
    @msg = Message.new
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
    puts @turns["Player"].board.render
    @turns["Player"].loop_for_player_coordinates(@ships[:player_cruiser])
    @turns["Player"].place_player_ship(@ships[:player_cruiser])
    puts @turns["Player"].board.render(true)
    @turns["Player"].loop_for_player_coordinates(@ships[:player_submarine])
    @turns["Player"].place_player_ship(@ships[:player_submarine])
    puts @msg.board_header_msg("Computer")
    puts @turns["Computer"].board.render
    puts @msg.board_header_msg("Player")
    puts @turns["Player"].board.render(true)
  end

  def player_rounds
    until check_for_sunk_ships
      puts @msg.player_shot_prompt_msg
      @turns["Computer"].player_response
      puts @turns["Player"].computer_shot
      puts @turns["Computer"].player_shot
      puts @msg.board_header_msg("Computer")
      puts @turns["Computer"].board.render
      puts @msg.board_header_msg("Player")
      puts @turns["Player"].board.render(true)
    end
  end

  def check_for_sunk_ships

    @ships.each do |key, ship|
      ship.sunk?
    end

  end

end