def shuffle(array)
  array.each_with_index do |n,i|
    from_index = i+rand(array.length-i)
    array[i], array[from_index] = array[from_index], array[i]
  end

  array
end

p shuffle([0,1,2,3,4,5,6,7,8,9])
