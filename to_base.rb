class Fixnum
  CHARS = ("0".."9").to_a + ('A'..'Z').to_a
  
  def to_base(base)
     return 0 if self == 0

     n = self
     ret_bin = ""
     ## Until val is zero, convert it into binary format
     while(n != 0)
       ret_bin = CHARS[n % base] + ret_bin
       n = n / base
     end
   
     ret_bin
  end
  def to_hex
    to_base(16)
  end
  def to_oct
    to_base(8)
  end
  def to_bin
    to_base(2)
  end
end

0.upto(32) do |i|
  p "#{i}: #{i.to_bin}"
end
