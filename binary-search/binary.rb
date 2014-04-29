class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError unless list.sort == list
    @list = list
  end

  def search_for(item, lower = 0, upper = list.length - 1)
    raise RuntimeError if lower > upper

    mid = middle(lower, upper)

    if item == list[mid]
      mid
    elsif item < list[mid]
      search_for(item, lower, mid - 1)
    elsif item > list[mid]
      search_for(item, mid + 1, upper)
    end
  end

  def middle(lower = 0, upper = list.length - 1)
    (lower + upper) / 2
  end
end