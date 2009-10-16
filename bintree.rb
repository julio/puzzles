class Node
  attr_reader :left, :right, :value
  
  def initialize(value, left=nil, right=nil)
    @value = value
    @left  = left
    @right = right
  end
end

class BinaryTree
  attr_reader :root
  
  #               [1]
  #              /   \
  #             /     \
  #           [2]     [3]
  #          /  \    /  \
  #        [4] [5] [6] [7]
  def initialize
    four  = Node.new(4)
    five  = Node.new(5)
    six   = Node.new(6)
    seven = Node.new(7)
    two   = Node.new(2, four, five)
    three = Node.new(3, six, seven)
    one   = Node.new(1, two, three)
    
    @root = one
  end
  
  def to_s
    print_node_depth_first(@root)
    p "========="
    print_node_breadth_first(@root)
  end
  
  def print_node_depth_first(node)
    return if node.nil? # in case root is nil

    p node.value
    
    print_node_depth_first(node.left)  if node.left
    print_node_depth_first(node.right) if node.right
  end

  def print_node_breadth_first(node)
    return if node.nil?
    
    @q ||= []
    @q << node.left
    @q << node.right
    
    p node.value
    
    print_node_breadth_first(@q.shift)
  end
end

tree = BinaryTree.new
p tree.to_s
