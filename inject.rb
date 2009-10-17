module Enumerable
  def my_map(&block)
    self.inject([]) {|arr,i| arr << block.call(i)}
  end
  def my_select(&block)
    self.inject([]) {|arr,i| if block.call(i) then arr << i else arr end}
  end
  def my_reject(&block)
    self.inject([]) {|arr,i| if block.call(i) then arr else arr << i end}
  end
  def my_sum
    self.inject(0) {|total,i| total + i}
  end
end

# select
p (1..10).select {|i| i % 2 == 0}
p (1..10).my_select {|i| i % 2 == 0}
# => [2, 4, 6, 8, 10]

# collect/map
p (1..10).map    {|i| i % 2 == 0}
p (1..10).my_map {|i| i % 2 == 0}
# => [false, true, false, true, false, true, false, true, false, true]

# reject
p (1..10).reject {|i| i % 2 == 0}
p (1..10).my_reject {|i| i % 2 == 0}
# => [1, 3, 5, 7, 9]

# sum/accu
p (1..10).my_sum
# => 55
