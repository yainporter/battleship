# class ComputerTurn
  
#   def initialize(name, test_player_input = nil)
#     @name = name
#     @board = Board.new
#     @check_player_input = test_player_input
#     @msg = Message.new
#     @quit_count = 0
#   end

#   def random_coordinate(ship)
#     sample = @board.cells.keys.sample(ship.length)
#     until @board.valid_placement?(ship, sample)
#       sample = @board.cells.keys.sample(ship.length)
#     end
#     sample
#   end

#   def valid_shot?(coordinate)
#     if board.valid_coordinate?(coordinate) && board.cells[coordinate].shots_fired == 0 
#       require 'pry'; binding.pry
#       true
#     else
#       puts @msg.invalid_coordinates_msg
#       player_response
#       quit?
#       player_shot
#     end
#   end

#   def computer_setup(cruiser, submarine)
#     @board.place(cruiser, random_coordinate(cruiser))
#     @board.place(submarine, random_coordinate(submarine))
#   end

#   def computer_shot
#     coordinate = @board.cells.keys.sample
#     until valid_shot?(coordinate)
#       coordinate = @board.cells.keys.sample
#     end
#     board.cells[coordinate].fire_upon
#     results = board.cells[coordinate].render
#     results = shot_results(results)
#     "My shot on #{coordinate} was a #{results}."
#   end
# end