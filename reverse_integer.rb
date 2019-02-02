def reverse_number(num)
  reversed = []
  while num % 10 > 0 && num / 10
    reversed.push(num % 10)
    num /= 10
  end

  n = 0
  0.upto(reversed.length-1) do
    number = reversed.shift
    multi = 10**reversed.length
    n += number * multi
  end

  n
end

require 'test/unit'

class ReverseNumber < Test::Unit::TestCase
  def test_1_number
    assert_equal 1, reverse_number(1)
  end
  def test_2_numbers
    assert_equal 12, reverse_number(21)
  end
  def test_many_numbers
    assert_equal 12345, reverse_number(54321)
  end
end
