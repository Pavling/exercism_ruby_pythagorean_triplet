class Triplet

  def self.where(params={})
    {max_factor: 10}.merge(params)
    max_factor = params.fetch(:max_factor)
    
    triplets = []
    (1..max_factor).each do |factor1|
      (1..max_factor).each do |factor2|
        (1..max_factor).each do |factor3|
          triplets << [factor1, factor2, factor3].sort
        end
      end
    end
    triplets = triplets.uniq.select {|triplet| Triplet.new(*triplet).pythagorean?}
    triplets.map {|triplet| Triplet.new(*triplet)}
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