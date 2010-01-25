a = [[2,3], [5,7], [10,1], [11,3], [100,13]]
b = [[1,1], [2,1], [10,1], [100,1]]
# => 3*1 + 1*1 => 4

def product(a, b)
  a_idx = b_idx = tot = 0

  while a[a_idx] && b[b_idx] do
    if a[a_idx][0] == b[b_idx][0]
      tot += a[a_idx][1] * b[b_idx][1]
      a_idx += 1
      b_idx += 1
    else
      if a[a_idx][0] > b[b_idx][0]
        b_idx += 1
      else
        a_idx += 1
      end
    end
  end
  tot
end

p product(a, b)
