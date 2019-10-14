# Given an array and a permutation, apply the permutation to the array. 

# For example: 
# given the array ['i', 'c', 'r', 'e'] and the permutation [2, 3, 1, 0]
# return ['e', 'r', 'i', 'c'].

class Solution: 
    def apply_permutation(self, array, indices):
        # Fill this in.
        
# Test program
array = ['i', 'c', 'r', 'e']
indices = [2, 3, 1, 0]

print(str(Solution().apply_permutation(array, indices)))
