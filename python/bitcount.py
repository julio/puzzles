import unittest

def count_bits(n):
  count = 0
  while n > 0:
    count += n & 1 > 0
    n >>= 1
  return count

class BitCountTest(unittest.TestCase):
    def test_1_bit(self):
        self.assertEqual(1, count_bits(1))
        self.assertEqual(1, count_bits(2))
        self.assertEqual(1, count_bits(8))

    def test_2_bits(self):
        self.assertEqual(2, count_bits(3))
        self.assertEqual(2, count_bits(12))
        self.assertEqual(2, count_bits(5))

if __name__ == '__main__':
    unittest.main()