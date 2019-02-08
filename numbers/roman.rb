class Roman
  def self.method_missing(name, *args)
    name = name.to_s.gsub("IV", "IIII")
    # etc for XC, XL, CD, ...
    
    name.count("I") +
    name.count("X") * 10
    # ... etc
  end
end

require "test/unit"

class RomanTest < Test::Unit::TestCase
  def test_valid_numbers
    assert_equal 12, Roman.XII
    assert_equal 14, Roman.XIV
  end
end
