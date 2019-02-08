# Write a program that prints the numbers from 1 to 100. 
# But for multiples of three print “Fizz” instead of the number 
# and for the multiples of five print “Buzz”. For numbers which 
# are multiples of both three and five print “FizzBuzz”."

max = 100

1.upto(max) do |n|
  if n%3 != 0 && n%5 != 0
    puts n
    next
  end

  if n%3 == 0
    print 'Fizz' 
  end
  if n%5 == 0
    print 'Buzz'
  end
  puts ''
end