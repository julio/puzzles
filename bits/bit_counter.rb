class BitCounter
  WORD_LENGTH = 64

  def self.count(n)
    0.upto(WORD_LENGTH-1).inject() do |count, i|
      count += 1 if n & 1 == 1
      n >>= 1
      count
    end
  end

  def self.power_of_two?(n)
    count(n) == 1
  end
end

require 'test/unit'

class BitCounterTest < Test::Unit::TestCase
  def test_0
    assert_equal 0, BitCounter.count(0)
  end

  def test_1
    assert_equal 1, BitCounter.count(1)
  end

  def test_2
    assert_equal 1, BitCounter.count(2)
  end

  def test_3
    assert_equal 2, BitCounter.count(3)
  end

  def test_15
    assert_equal 4, BitCounter.count(15)
  end

  def test_15_not_power_of_two
    assert_false BitCounter.power_of_two?(15)
  end

  def test_8_power_of_two
    assert_true BitCounter.power_of_two?(8)
  end
end
