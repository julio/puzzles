require "test/unit"

def div(x, y)
  count = 0
  while x >= y
    x = x-y
    count += 1
  end
  [count, x]
end

class TestDiv < Test::Unit::TestCase
  def test_div
    assert_equal [6, 0], div(12, 2)
    assert_equal [6, 1], div(13, 2)
    assert_equal [1, 0], div(1, 1)
    assert_equal [100, 0], div(100, 1)
    assert_equal [5, 0], div(100, 20)
    assert_equal [4, 16], div(100, 21)
  end
end

