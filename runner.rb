require './spec/spec_helper'

player_battleship = Battleship.new
computer_battleship = Battleship.new
submarine = Ship.new("Submarine", 2)
cruiser = Ship.new("Cruiser", 3)

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