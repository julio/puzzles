class Queue
  def initialize(n)
    @max = n
    @store = []
  end
  
  def << (e)
    @store.unshift(e)
    @store.pop if @store.length > @max
  end
end

q = Queue.new(3)
q << 1
q << 2
q << 3
q << 4
q << 5

p q