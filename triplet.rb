class Triplet

  def initialize(a, b, c)
    @sides = [a, b, c]
  end

  def product
    @sides.reduce(:*)
  end

  def sum
    @sides.reduce(:+)
  end

end