def genknuth(m, n)
  0.upto(n-1) do |i|
    if (rand * 1000000 % (n-i)) < m
      p i
      m -= 1
    end 
  end
end

genknuth(20,50)