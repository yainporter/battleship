require './spec/spec_helper'

player_battleship = Battleship.new
computer_battleship = Battleship.new
submarine = Ship.new("Submarine", 2)
cruiser = Ship.new("Cruiser", 3)
computer_turn = Turn.new(computer_battleship)
player_turn = Turn.new(player_battleship)

puts player_battleship.main_menu
player_battleship.player_response
player_battleship.check_main_menu_input
computer_battleship.computer_setup
puts player_battleship.board.render
puts player_battleship.ship_message("cruiser")
player_battleship.loop_for_player_coordinates(cruiser)
player_battleship.place_player_ship (cruiser)
puts player_battleship.board.render(true)
puts player_battleship.ship_message("submarine")
player_battleship.loop_for_player_coordinates(submarine)
player_battleship.place_player_ship(submarine)
puts player_battleship.board.render(true)
puts computer_turn.board_text("computer")
puts computer_battleship.board.render
puts player_turn.board_text("player")
puts player_battleship.board.render(true)

####### First Round #########
puts player_battleship.player_shot_prompt
computer_battleship.player_response
puts player_battleship.computer_shot
puts computer_battleship.player_shot
puts computer_turn.board_text("computer")
puts computer_battleship.board.render
puts player_turn.board_text("player")
puts player_battleship.board.render(true)

####### Second Round #########

puts player_battleship.player_shot_prompt
computer_battleship.player_response
puts player_battleship.computer_shot
puts computer_battleship.player_shot
puts computer_turn.board_text("computer")
puts computer_battleship.board.render
puts player_turn.board_text("player")
puts player_battleship.board.render(true)

####### Third Round #############

puts player_battleship.player_shot_prompt
computer_battleship.player_response
puts player_battleship.computer_shot
puts computer_battleship.player_shot
puts computer_turn.board_text("computer")
puts computer_battleship.board.render
puts player_turn.board_text("player")
puts player_battleship.board.render(true)

####### Fourth Round #############

puts player_battleship.player_shot_prompt
computer_battleship.player_response
puts player_battleship.computer_shot
puts computer_battleship.player_shot
puts computer_turn.board_text("computer")
puts computer_battleship.board.render
puts player_turn.board_text("player")
puts player_battleship.board.render(true)

####### Fifth Round #############

puts player_battleship.player_shot_prompt
computer_battleship.player_response
puts player_battleship.computer_shot
puts computer_battleship.player_shot
puts computer_turn.board_text("computer")
puts computer_battleship.board.render
puts player_turn.board_text("player")
puts player_battleship.board.render(true)

####### Sixth Round #############

puts player_battleship.player_shot_prompt
computer_battleship.player_response
puts player_battleship.computer_shot
puts computer_battleship.player_shot
puts computer_turn.board_text("computer")
puts computer_battleship.board.render
puts player_turn.board_text("player")
puts player_battleship.board.render(true)

####### Seventh Round #############

puts player_battleship.player_shot_prompt
computer_battleship.player_response
puts player_battleship.computer_shot
puts computer_battleship.player_shot
puts computer_turn.board_text("computer")
puts computer_battleship.board.render
puts player_turn.board_text("player")
puts player_battleship.board.render(true)