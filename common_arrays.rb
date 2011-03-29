a1 = [1,2,2,2,3,3]
a2 = [2,2,3,3,4,5]

def subarray(a1, a2)
  a2.join.include?(a1.join) ? a1 : []
end

maxsub=[]
0.upto(a1.length-1) do |i|
  i.upto(a1.length-1) do |j|
    sub = subarray(a1[i..j], a2)
    if sub.length > maxsub.length
      maxsub = sub
    end
  end
end

p maxsub
