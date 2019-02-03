# Is the string in memory
# Can the string be nil
# Is Ruby ok
# string.reverse in the real world
# in place or new string?

# == recursive solution

# ruby

def recursive_reverse(str)
  str == '' ? '' : recursive_reverse(str[1..-1]) + str[0]
end

def revert_array(str)
  str.split('').reverse.join('')
end

# javascript

# function reverseString(str) {
#     return str.split("").reverse().join("");
# }

# == for loop

# javascript

# function reverseString(str) {
#     return str.split("").reverse().join("");
# }

# ruby

def reverse(str)
  return unless str
  return str if str.length == 1

  # without changing the original string
  # new_str = String.new(str)

  # changing the original string
  new_str = str

  0.upto(str.length/2 - 1) do |i|
    new_str[i], new_str[str.length-i-1] = new_str[str.length-i-1], new_str[i]
  end

  new_str
end

require 'test/unit'

class ReverseString < Test::Unit::TestCase
  def test_nil
    assert_nil reverse(nil)
  end

  def test_single_char
    assert_equal '1'.reverse, reverse('1')
  end

  def test_even_count
    assert_equal '1234'.reverse, reverse('1234')
  end

  def test_odd_count
    assert_equal '123'.reverse, reverse('123')
  end

  def test_unicode
    assert_equal 'φ123'.reverse, reverse('φ123')
  end

  def test_recursive
    assert_equal '12345'.reverse, recursive_reverse('12345')
  end

  def test_recursive_array
    assert_equal '12345'.reverse, revert_array('12345')
  end
end
