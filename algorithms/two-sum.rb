def two_sum(array, target)
  map = {}
  array.each_with_index do |num, i|
     map[num] = i
  end

  array.each_with_index do |num, i|
    complement = target - num
    if map[complement] && map[complement] != i
      return [i, map[complement]]
    end
  end

  raise 'No solution'
end

indices = two_sum([2,7,11,15], 13)
puts "indices: #{indices}"