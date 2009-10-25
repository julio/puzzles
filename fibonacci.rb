# 0 1 2 3 4 5 6  7  8   9 10
# 1 1 2 3 5 8 13 21 34 55 89

# def fib2(n)
#   return 1 if n <= 1
#   @store ||= {}
#   (@store[n-1] ||= fib2(n-1)) + (@store[n-2] ||= fib2(n-2))
# end
# 1.upto(40) do |x|
#   t0 = Time.now
#   fib2(x)
#   puts "#{x}: #{(Time.now - t0)} seconds"
# end
# 
# def fib1(n)
#   n <= 1 ? 1 : fib1(n-1) + fib1(n-2)
# end
# 1.upto(40) do |x|
#   t0 = Time.now
#   fib1(x)
#   puts "#{x}: #{(Time.now - t0)} seconds"
# end
def fib3(n)
  return 1 if n <= 1
  @store ||= {}
  (@store[n-1] ||= fib3(n-1)) + (@store[n-2] ||= fib3(n-2))
end
1.upto(40) do |x|
  t0 = Time.now
  fib3(x)
  puts "#{x}: #{(Time.now - t0)} seconds"
end
