class Board
  attr_reader :cells, :name

  def initialize(name = nil)
    @name = name
    @cells = create_cells
  end

  def create_cells
    @cells = {}
    create_cells_hash
    @cells
  end

  def create_cells_hash
    cell_array.each {|cell| @cells.store(cell, Cell.new(cell))}
  end

  def valid_coordinate?(coordinate)
    true_or_false = false
    @cells.each do |key,value|
      key.to_s == coordinate && value.empty? ? true_or_false = true : false
    end
    true_or_false
  end

  def valid_placement?(ship, coordinates)
    # if coordinates == ["A1", "A2"] then require 'pry'; binding.pry end
    if coordinates.count == ship.length && down?(coordinates) && coordinates_empty?(coordinates)
      true
    elsif coordinates.count == ship.length && across?(coordinates) && coordinates_empty?(coordinates)
      true
    else
      false
    end
  end

  def place(ship, coordinates)
    coordinates.each {|coordinate| @cells[coordinate].place_ship(ship)}
  end

  def render(true_or_false = nil)
    true_or_false == true ? render_true(true_or_false) : render_nil
  end


    # def valid_placement?(ship, coordinates)
  #   true_or_false = nil
  #   if coordinates.count == ship.length
  #     across = check_index(find_index_array_across(coordinates))
  #     down = check_index(find_index_array_down(coordinates))
  #     if across.include?(false) && down.include?(false)
  #       true_or_false = false
  #     elsif across.include?(false) && check_down(coordinates) == false
  #       true_or_false = false
  #     elsif down.include?(false) && across.include?(false) == false
  #       true_or_false = true
  #     elsif across.include?(false) && down.include?(false) == false
  #       true_or_false = true
  #     end
  #   else
  #     true_or_false = false
  #   end
  #   true_or_false
  # end

  # def find_index_array_across(coordinates)
  #   index_array = []
  #   coordinates.each do |coordinate|
  #     index_array << cell_array.find_index(coordinate)
  #   end
  #   index_array
  # end

  # def check_index(array)
  #   next_index = nil
  #   array.map do |index|
  #     if next_index == nil
  #       next_index = index.next
  #     else
  #       if index == next_index
  #         next_index = index.next
  #         true
  #       else
  #         next_index = index.next
  #         false
  #       end
  #     end
  #   end
  # end

  # def find_index_array_down(coordinates)
  #   letter_array = []
  #   coordinates.each do |coordinate|
  #     letter_array << coordinate.chop
  #   end
  #   letter_array
  # end

  # def check_down(coordinates)
  #   first_chr = []
  #   last_chr = []
  #   coordinates.each do |coordinate|
  #     first_chr << coordinate.chr
  #     last_chr << coordinate.slice(-1)
  #   end
  #   if last_chr.uniq.count == 1 && check_index(first_chr).include?(false) == false
  #     true
  #   else 
  #     false
  #   end
  # end

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
    if same_second_char?(coordinates) && consecutive_first_char?(coordinates)
      true
    end
  end

  def across?(coordinates)
    if consecutive_second_char?(coordinates) && same_first_char?(coordinates)
      true
    end
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
#   sub =  ["A1", "A2"]
#   submarine =  ["A1", "C1"]
#   cruiser = ["A3", "A2", "A1"]
#   index_array = []
#   sub.each do |coordinate|
#     index_array << cell_array.find_index(coordinate)
#   end
#  next_index = nil
#   index_array.map do |index|
#     if next_index == nil
#       next_index = index += 1
#     else
#       if index == next_index
#         next_index = index += 1
#         true
#       else
#         next_index = index += 1
#         false
#       end
#     end
#   end
#   require 'pry'; binding.pry
end