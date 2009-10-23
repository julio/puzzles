module Reverser
  def rev
    self.length == 1 ? self : self[-1..-1] + self[0..-2].rev
  end
end

[String, Array].each do |cls|
  cls.send(:include, Reverser)
  # cls.class_eval {include Reverser}
end

t0 = Time.now
1.upto(1000000) do
  "12345".reverse
end
p "theirs: #{Time.now-t0}"

t0 = Time.now
1.upto(1000000) do
  "12345".rev
end
p "mine: #{Time.now-t0}"


# p [1,2,3,4,5].rev

# p String.rev("ABCDE")
# p Array.rev([1,2,3,4,5])

# l = lambda {|x| x+1}
# p l.call(2)
