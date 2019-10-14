import unittest

class Node():
    flat_tree = []

    def __init__(self, value):
        self.left = None
        self.right = None
        self.value = value
        

    def preorder(self):
        Node.flat_tree.append(self.value)

        if self.left:
            self.left.preorder()
        if self.right: 
            self.right.preorder()

    def invert(self):
        Node.flat_tree = []

        temp = self.left
        self.left = self.right
        self.right = temp

        if self.right:
            self.right.invert()
        if self.left:
            self.left.invert()

class TestTreeInverter(unittest.TestCase):
    def test_invert(self):
        root = Node('a') 
        root.left = Node('b') 
        root.right = Node('c') 
        root.left.left = Node('d') 
        root.left.right = Node('e') 
        root.right.left = Node('f') 

        root.preorder()
        self.assertEqual(['a', 'b', 'd', 'e', 'c', 'f'], root.flat_tree)

        root.invert()
        root.preorder()
        self.assertEqual(['a', 'c', 'f', 'b', 'e', 'd'], root.flat_tree)

if __name__ == '__main__':
    unittest.main()
