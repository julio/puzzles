arr = [
 [1,  2,   3,   4],
 [5,  6,   7,   8],
 [9, 'A', 'B', 'C']
]

x=0
y=0
w=arr[y].length
a=arr[y]
a.each do |i|
  print i
end
print ' '

x=w-1
y+=1
w=arr[y].length
a=arr[y]
1.upto(arr.length-1) do |i|
  print arr[i][arr[i].length-1]
end
print ' '
arr.last.reverse[1..-1].each do |i|
  print i
end
print ' '
1.upto(arr.length-1) do |i|
  print arr[i][arr[i].length-1]
end
