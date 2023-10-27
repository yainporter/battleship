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

  def fired_upon
    @shots_fired += 1
    @ship.hit
  end

  def fired_upon?
    if @shots_fired == 0
      false
    else
      true
    end
  end
end