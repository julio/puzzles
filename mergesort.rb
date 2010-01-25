# ---------------------------------------------------------------------------
# merge sort
# ---------------------------------------------------------------------------
class Array
  def mergesort
    if self.length <= 1
      return self
    end

    mid = self.size / 2
    left = self[0, mid]
    right = self[mid, self.size]
    merge(left.mergesort, right.mergesort)
  end
  def merge(left, right)
    sorted = []
    until left.empty? or right.empty?
      if left.first <= right.first
        sorted << left.shift
      else
        sorted << right.shift
      end
    end

    sorted + left + right
  end
end

p [0,3,1,2,4,9,7,6,5,8].mergesort
