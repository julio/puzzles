# Stack that remembers the lowest value added

class SuperStack
  attr_reader :min
  
  def initialize
    @min   = nil
    @store = []
    @mins  = []
  end
  
  def push(n)
    @store.unshift(n)
    if @min.nil?
      @min = n
      @mins.unshift(n)
    else
      @mins.unshift(n) if n <= @min
      @min = [@min, n].min
    end
  end

  def pop
    raise "Bad" unless @store[0]
    
    element = @store.shift
    if element == @min
      @mins.shift
      @min = @mins[0]
    end
    element
  end
  
end

s = SuperStack.new
p s.min
s.push(1)
p s.min
s.push(2)
p s.min
s.push(3)
p s.min
s.push(-1)
p s.min
s.push(-5)
p s.min
s.push(-5)
p s.min

p "================="
p s.pop
p s.min
p "--"
p s.pop
p s.min
p "--"
p s.pop
p s.min
p "--"
p s.pop
p s.min
p "--"
p s.pop
p s.min
p "--"
p s.pop
p s.min
p "--"
p s.pop
p s.min
p "--"
