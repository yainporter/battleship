
class Board
  attr_reader :cells, :name

  def initialize(name = nil)
    @name = name
    @cells = create_cells
  end

  def create_cells
    @cells = {}
    cell_array.each {|cell| @cells.store(cell, Cell.new(cell))}
    @cells
  end

  def valid_coordinate?(coordinate)
    coordinate.respond_to?(:split) ? coordinates = coordinate.split : coordinates = coordinate
    true_or_false = false
    @cells.each do |key_coordinate,cell|
      coordinates.each do |coordinate|
        if key_coordinate.to_s == coordinate && cell.empty? 
          true_or_false = true 
        end
      end
    true_or_false
  end

  #Method to validate coordinate(s)

  def valid_placement?(ship, coordinates) 
    if coordinates.count == ship.length && coordinates_empty?(coordinates) && down_or_across?(coordinates)
      true
    else
      false
    end

    #How can I refactor this?
    # if coordinates.count == ship.length && down?(coordinates) && coordinates_empty?(coordinates)
    #   true
    # elsif coordinates.count == ship.length && across?(coordinates) && coordinates_empty?(coordinates)
    #   true
    # else
    #   false
    # end
  end

  def place(ship, coordinates)
    coordinates.each {|coordinate| @cells[coordinate].place_ship(ship)}
  end

  def render(true_or_false = nil)
    true_or_false == true ? render_true(true_or_false) : render_nil
  end

  def valid_cell?(coordinate)
    coordinate = coordinate
    if cells[coordinate] == nil
      nil
    elsif cells[coordinate].valid_cell?
      true
    else
      false
    end
  end

####################### PRIVATE METHODS START ###########################
  private

  def render_true(true_or_false)
    "  1 2 3 4 \n" +
    "A #{cells["A1"].render(true_or_false)} #{cells["A2"].render(true_or_false)} #{cells["A3"].render(true_or_false)} #{cells["A4"].render(true_or_false)} \n" +
    "B #{cells["B1"].render(true_or_false)} #{cells["B2"].render(true_or_false)} #{cells["B3"].render(true_or_false)} #{cells["B4"].render(true_or_false)} \n" +
    "C #{cells["C1"].render(true_or_false)} #{cells["C2"].render(true_or_false)} #{cells["C3"].render(true_or_false)} #{cells["C4"].render(true_or_false)} \n" +
    "D #{cells["D1"].render(true_or_false)} #{cells["D2"].render(true_or_false)} #{cells["D3"].render(true_or_false)} #{cells["D4"].render(true_or_false)} \n" 
  end

  def render_nil
    "  1 2 3 4 \n" +
    "A #{cells["A1"].render} #{cells["A2"].render} #{cells["A3"].render} #{cells["A4"].render} \n" +
    "B #{cells["B1"].render} #{cells["B2"].render} #{cells["B3"].render} #{cells["B4"].render} \n" +
    "C #{cells["C1"].render} #{cells["C2"].render} #{cells["C3"].render} #{cells["C4"].render} \n" +
    "D #{cells["D1"].render} #{cells["D2"].render} #{cells["D3"].render} #{cells["D4"].render} \n" 
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

  def down?(coordinates)
    same_second_char?(coordinates) && consecutive_first_char?(coordinates)

  end

  def across?(coordinates)
    consecutive_second_char?(coordinates) && same_first_char?(coordinates)
  end

  def down_or_across?(coordinates)
  true if across?(coordinates) || down?(coordinates)
  end

  def consecutive_first_char?(coordinates)
    first_char = first_char(coordinates)
    first_char == (first_char[0]..first_char[-1]).to_a
  end

  def consecutive_second_char?(coordinates)
    second_char = second_char(coordinates)
    second_char.map {|char| char.to_i} == (second_char[0].to_i..second_char[-1].to_i).to_a
  end

  def same_first_char?(coordinates)
    first_char = first_char(coordinates)
    first_char.uniq.count == 1
  end

  def same_second_char?(coordinates)
    second_char = second_char(coordinates)
    second_char.uniq.count == 1
  end

  def first_char(coordinates)
    first_char = []
    coordinates.each do |coordinate|
      first_char << coordinate[0]
    end
    first_char
  end

  def second_char(coordinates)
    second_char = []
    coordinates.each do |coordinate|
      second_char << coordinate[1]
    end
    second_char
  end

  def coordinates_empty?(coordinates)
    true_or_false = []
    coordinates.each do |coordinate|
        true_or_false << @cells[coordinate].empty?
    end
    true_or_false.include?(false) ? false : true
  end
end
