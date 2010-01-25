require "test/unit"

def prefix_array(arr, count, digit)
  0.upto(count-1) { arr.unshift(0) }
  arr
end

def add(n, m)
  prefix_array(n, m.length - n.length, 0)
  prefix_array(m, n.length - m.length, 0)
  
  total = []
  carry = 0
  (n.length-1).downto(0) do |x|
    total[x] = ((n[x] + m[x]) + carry) % 10
    carry = ((n[x] + m[x] + carry) / 10)
  end
  total.unshift(carry).to_s.to_i
end

class AddTest < Test::Unit::TestCase
  def test_add
    assert_equal 5, add([2], [3])
    assert_equal 444, add([1,2,3], [3,2,1])
    assert_equal 4444, add([1,2,3], [4,3,2,1])
    assert_equal 1000, add([9,9,9], [1])
    assert_equal 199998, add([9,9,9,9,9], [9,9,9,9,9])
    assert_equal 99999, add([0], [9,9,9,9,9])
    assert_equal 1_000_000_000_000_000_000_000, add([1], [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9])
  end
end
