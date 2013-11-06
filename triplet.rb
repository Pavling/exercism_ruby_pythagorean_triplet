class Triplet

  def initialize(a, b, c)
    @sides = [a, b, c]
  end


  def sum
    @sides.reduce(:+)
  end

end