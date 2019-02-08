def hindex(citations)
  return 0 if citations.nil? || citations.empty?

  n = citations.size
  return citations[0] if n == 1

  citations.sort.each_with_index do |c, index|
    return n - index if c >= n - index
  end
  0
end

require 'test/unit'
class HIndexTest < Test::Unit::TestCase
  def test_empty
    assert_equal(0, hindex([]))
    assert_equal(0, hindex(nil))
  end

  def test_single
    assert_equal 3, hindex([3])
  end

  def test_many
    assert_equal 4, hindex([1,4,1,4,2,1,3,5,6])
    assert_equal 2, hindex([1,2,3,4])
    assert_equal 3, hindex([1,2,3,4,5])
  end
end

