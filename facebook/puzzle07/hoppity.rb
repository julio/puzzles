File.open(ARGV[0]) do |file|
  1.upto(file.gets.chomp.to_i) do |i|
    case 0
      when i % 5 + i % 3 then puts "Hop"
      when i % 3         then puts "Hoppity"
      when i % 5         then puts "Hophop"
    end
  end
end
