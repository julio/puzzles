class RomanConverter
  def initialize
    @double_romans = {
      "IV" => "IIII",
      "IX" => "VIIII",
      "XL" => "XXXX",
      "XC" => "LXXXX",
      "CD" => "CCCC",
      "CM" => "DCCCC"
    }
    @single_romans = {
      "I"  => 1,
      "V"  => 5,
      "X"  => 10,
      "L"  => 50,
      "C"  => 100,
      "D"  => 500,
      "M"  => 1_000
    }
  end
  
  def normalize(r)
    @double_romans.each do |k,v|
      r=r.gsub(k, @double_romans[k])
    end
    r
  end

  def convert(r)
    r=normalize(r)
    dec = 0
  
    r.chars.each do |n|
      dec += @single_romans[n]
    end
  
    dec
  end
end

converter = RomanConverter.new

puts converter.convert("MCMLXV")
puts converter.convert("MCMXCIX")
