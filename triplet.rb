class Triplet

  def self.where(params={})
    min_factor = params.fetch(:min_factor, 1)
    max_factor = params.fetch(:max_factor)
    factor_sum = params.fetch(:sum, nil)
    
    triplets = (min_factor..max_factor).to_a.combination(3).map { |triplet| Triplet.new(*triplet) }

    triplets.select! { |triplet| triplet.sum == factor_sum } if factor_sum
    triplets.select! { |triplet| triplet.pythagorean? }
  end

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