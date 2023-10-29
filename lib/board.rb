class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1": Cell.new("A1"),
      "A2": Cell.new("A2"),
      "A3": Cell.new("A3"),
      "A4": Cell.new("A4"),
      "B1": Cell.new("B1"),
      "B2": Cell.new("B2"),
      "B3": Cell.new("B3"),
      "B4": Cell.new("B4"),
      "C1": Cell.new("C1"),
      "C2": Cell.new("C2"),
      "C3": Cell.new("C3"),
      "C4": Cell.new("C4"),
      "D1": Cell.new("D1"),
      "D2": Cell.new("D2"),
      "D3": Cell.new("D3"),
      "D4": Cell.new("D4"),
    }
  end

  def valid_coordinate?(coordinate)
    true_or_false = false
    @cells.each do |key,value|
      if key.to_s == coordinate 
        true_or_false = true
      end
    end
    true_or_false
  end

  def valid_placement?(ship, coordinates)
    require 'pry' ; binding.pry
    if coordinates.count == ship.length

    else
      false 
    end
  end

  def cell_array
    cell_array = []
    number = 1
    until number == 5
      ("A".."D").each {|letter| cell_array << letter + number.to_s}
      number += 1
    end
    cell_array.sort
  end
end