require 'test/unit'

class Array
  def swap(n,m)
    self[n], self[m] = self[m], self[n]
  end

  def insertion_sort
    (1).upto(length-1) do |i|
      partial_sort(i) if self[i-1] > self[i]
    end
    self
  end

  private

  def partial_sort(i)
    (i).downto(1) do |j|
      swap(j, j-1) if self[j] < self[j-1]
    end
  end
end

class SortTest < Test::Unit::TestCase
  def test_empty
    assert_equal([].insertion_sort, [])
  end

  def test_1_number
    assert_equal([1].insertion_sort, [1])
  end

  def test_2_number
    assert_equal([1,2].insertion_sort, [1,2])
    assert_equal([2,1].insertion_sort, [1,2])
  end

  def test_many_numbers
    assert_equal([1,2,3,4,5].insertion_sort, [1,2,3,4,5])
    assert_equal([3,4,5,2,1].insertion_sort, [1,2,3,4,5])
  end
end
