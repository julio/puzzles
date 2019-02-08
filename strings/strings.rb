# ---------------------------------------------------------------------------
# Things with strings: sub-string and rot13
# ---------------------------------------------------------------------------

class String
  def strstr(sub)
    _strstr(sub, 0)
  end
  
  def _strstr(sub, index)
    # p self[index, sub.length]
    return nil if sub.length > self[index, sub.length].length
    return sub if sub == self[index, sub.length]
    _strstr(sub, index+1)
  end
  
  def rot13
    self.tr("A-Ma-mN-Zn-z", "N-Zn-zA-Ma-m")
  end
end

p ["zzz", "YYY", "BBB", "aaa"].sort # => doesn't work
p ["zzz", "YYY", "BBB", "aaa"].sort {|a,b| a<=>b} # => works

p "ABCDE".strstr("CD")
p "ABCDE".strstr("XYZ")

p "ABC".rot13