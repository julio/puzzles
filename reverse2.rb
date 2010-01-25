class String
  def my_reverse
    self.length == 1 ? self : self[-1..-1] + self[0..-2].my_reverse
  end
end

# t0 = Time.now
# 1.upto(1_000_000) do
#   "54321".reverse
# end
# p "Ruby's: #{Time.now-t0}"
# 
# t0 = Time.now
# 1.upto(1_000_000) do
p  "54321".my_reverse
# end
# p "Mine: #{Time.now-t0}"
