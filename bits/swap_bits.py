import unittest

def bit_at(n, i):
  return (n >> i) & 1

def swap_bits(n, i, j) -> int:
  bit_at_i = bit_at(n, i)
  bit_at_j = bit_at(n, j)

  if bit_at_i == bit_at_j:
    return n

  (n << j) & bit_at_i
  (n << i) & bit_at_j

  return n

class SwapBitTest(unittest.TestCase):
    def test_1(self):
        self.assertEqual(0b0010, swap_bits(0b0001, 0, 1))

if __name__ == '__main__':
    unittest.main()