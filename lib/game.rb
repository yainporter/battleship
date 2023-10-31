class Game
  attr_reader :turns, :cruiser, :submarine, :msg

  def initialize
    @turns = {"Player" => Turn.new("Player"), "Computer" => Turn.new("Computer")}
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @msg = Message.new
  end

  def main_menu
    msg.main_menu_msg
    turns["Player"].player_response
    turns["Player"].check_main_menu_input
  end

  def game_set_up
    
  end

end