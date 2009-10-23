def quicksort(list, left, right)
  if left < right
    pivot = partition(list, left, right)
    quicksort(list, left, pivot-1)
    quicksort(list, pivot+1, right)
  end
end

def partition(list, left, right)
  pivot = list[right]
  i = left - 1
  left.upto(right-1) do |j|
    if list[j] <= pivot
      i = i+1
      list[i], list[j] = list[j], list[i]
    end
  end
  list[i+1],list[right] = list[right],list[i+1]
  return i + 1
end

a = [0,9,8,7,6,5,4,3,2,1]
quicksort(a, 0, 9)
p a
