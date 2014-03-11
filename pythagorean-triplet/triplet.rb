class Triplet
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a**2 + b**2 == c**2
  end

  class << self
    def where(min_factor: 1, max_factor: nil, sum: nil)
      matrix = (min_factor..max_factor).to_a.combination(3).to_a
      matrix.select! { |a, b, c| a + b + c == sum } if sum

      matrix.each_with_object([]) do |(a, b, c), result|
        triplet = new(a, b, c)
        result << triplet if triplet.pythagorean?
      end
    end
  end
end