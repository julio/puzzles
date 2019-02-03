def fibo(n)
  a,b=1,2
  (n-2).times do |i|
    min = b
    max = a + b


    a = min
    b = max
  end
  puts "a: #{a}"
end

fibo(30)