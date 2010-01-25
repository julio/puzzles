# ---------------------------------------------------------------------------
# Get random item from list with unknown items
# ---------------------------------------------------------------------------

def get_random_element(l)
  raise "Bad" if l.nil?

  n = rand(1_000_000)
  index, len = 0, 0
  while true
    return l.current if n == index
    if l.has_next?
      l.advance
      len += 1
      index += 1 
    else
      n = n % len
      l.reset
      index = 0
    end
  end
end

class MyList
  def initialize
    @store = %w[a b c d]
    @length = @store.length
    reset
  end

  def reset;     @index = 0       end
  def advance;   @index += 1      end
  def current;   @store[@index]   end
  def has_next?; @index < @length end
end

hash = Hash.new(0)
1.upto(100) do
  element = get_random_element(MyList.new)
  hash[element] += 1
end

p hash.to_a.sort {|v1,v2| v2[1] <=> v1[1]}
