def count_bits(n: int) -> int:
  count = 0
  while n > 0:
    count += n & 1 > 0
    n >>= 1
  return count

def parity(n: int) -> int:
  if count_bits(n) % 2 == 0:
    return 0
  return 1

print(parity(12345678909876542))