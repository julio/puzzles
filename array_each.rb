a = (1..16).to_a
# four at the time
a.each_index {|i| p a[i,4] if i % 4 == 0}
a.each_slice(4) {|s| p s}