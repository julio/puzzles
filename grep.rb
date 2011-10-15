phrase = /\d/
file_name = __FILE__
File.readlines(file_name).each_with_index {|l,i| p "#{i+1}: #{l}" if l.index(phrase)}

foo 11
