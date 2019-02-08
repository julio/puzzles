def gcd(m, n)
  r = m % n
  if r == 0
    n
  else
    gcd(n, r)
  end
end

p gcd(9, 28)