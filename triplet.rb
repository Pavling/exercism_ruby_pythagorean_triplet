class Triplet

  def initialize(a, b, c)
    @sides = [a, b, c].sort
  end

  def product
    @sides.reduce(:*)
  end

  def sum
    @sides.reduce(:+)
  end

  def pythagorean?
    @sides[0,2].map { |side| side**2 }.reduce(:+) == @sides[-1]**2
  end

end