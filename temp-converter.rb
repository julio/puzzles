# ---------------------------------------------------------------------------
# Temperature converter
# ---------------------------------------------------------------------------

puts "Enter the temperature and scale (C or F): "

input = gets.chomp

if input.nil? or input.empty?
  abort "Bad input"
end

temp, scale = input.split(" ")

if temp !~ /-?\d+/
  abort "Not a number"
end

temp = temp.to_f

case scale
  when "C", "c"
    f = 1.8 * temp + 32
  when "F", "f"
    c = temp + 5.0/9.0 - 32
else
  abort "Bad scale"
end

if f
  puts "#{temp} C = #{f} F"
else
  puts "#{temp} F = #{c} C"
end
