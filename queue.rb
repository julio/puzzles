class Q
  def initialize
    @store = []
  end
  
  def push(value)
    @store.unshift(value)
  end
  
  def pull
    @store.pop
  end
end

q = Q.new
q.push(1)
q.push(2)
q.push(3)
q.push(4)

p q.pull
p q.pull
p q.pull
p q.pull
