class Integer
  def palindrome?
    return false if self < 0
    return true if self < 10

    to_array(self) == to_array(self).reverse
  end

  def to_array(n)
    array = []
    while n%10 != 0 || n/10 != 0
      array.unshift n%10
      n /= 10
    end
    array
  end
end

require 'test/unit'

class NPalindrome < Test::Unit::TestCase
  def test_single
    assert 1.palindrome?
  end

  def test_negative
    assert_false -101.palindrome?
  end

  def test_is_palindrome
    assert 101.palindrome?
  end
end