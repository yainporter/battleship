class Cell 
  attr_reader :coordinate, :ship, :shots_fired

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @shots_fired = 0
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(cruiser)
    @ship = cruiser
  end

  def fire_upon
    @shots_fired += 1
    if empty?
      nil
    else
      @ship.hit
    end
  end

  def fired_upon?
    if @shots_fired == 0
      false
    else
      true
    end
  end

  def render(true_or_false = nil)
    if true_or_false == true && shots_fired == 0 && @ship != nil
      "S"
    elsif shots_fired == 0 
      "."
    elsif shots_fired > 0 && @ship == nil
      "M"
    elsif shots_fired > 0 && @ship.sunk? 
      "X"
    elsif shots_fired > 0 && @ship != nil
      "H"
    else 
      ""
    end
  end
end