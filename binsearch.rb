def binary_search(a, n, left, right)
  return nil if a.empty?
  
  mid = a.length / 2
  

  if n == a[mid]
    return mid
  elsif n < a[mid]
    right = mid
  else
    left = mid
  end
  
  binary_search(a[left..right], n, left, right)
end

require "test/unit"

class BinarySearchTest < Test::Unit::TestCase
  def test_should_find_index_of_value
    assert_equal 3, binary_search([1,2,3,4,5,6,7], 4, 0, 6)
    assert_equal 3, binary_search([1,2,3,4,5,6], 4, 0, 5)
    assert_equal nil, binary_search([], 4, 0, 5)
    assert_equal 0, binary_search([1], 1, 0, 0)
    assert_equal 3, binary_search([1,1,1,1,1,1], 1, 0, 5)
  end
end
