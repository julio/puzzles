# Recursion without caching. Complexity is O(2^n)
def fib1(n)
  n <= 1 ? 1 : fib1(n-1) + fib1(n-2)
end

# Recursion with caching. Complexity is O(n)
def fib2(n)
  return 1 if n <= 1

  @store ||= {}
  @store[n-1] ||= fib2(n-1)
  @store[n-2] ||= fib2(n-2)
  @store[n-1] + @store[n-2]
end

# Iterative. Complexity is O(n)
def fib3(n)
  return 1 if n <= 1

  pair = [1,1]
  2.upto(n) do |x|
    if x%2 == 0
      pair[0] = pair[0] + pair[1]
      pair[1] = pair[0] + pair[1]
    end
  end

  n%2 == 0 ? pair[0] : pair[1]
end

p fib1(7)
p fib2(7)
p fib3(7)

p fib1(8)
p fib2(8)
p fib3(8)

require "benchmark"

n = ARGV[0] || 5
n = n.to_i

Benchmark.benchmark do |bm|
  bm.report("fib1(#{n}) - recursive no cache") { fib1(n) }
  bm.report("fib2(#{n}) - recursive w/ cache") { fib2(n) }
  bm.report("fib3(#{n}) - iterative         ") { fib3(n) }
end

