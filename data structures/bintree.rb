# ---------------------------------------------------------------------------
# Binary tree
# ---------------------------------------------------------------------------

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
  
  #               [6]
  #             /     \
  #           [4]     [8]
  #          /  \    /  \
  #        [3] [5] [7] [9]
  def initialize
    three = Node.new(3)
    five  = Node.new(5)
    seven = Node.new(7)
    nine  = Node.new(9)
    eight = Node.new(8, seven, nine)
    four  = Node.new(4, three, five)
    six   = Node.new(6, four, eight)
    
    @root = six
  end
  
  def to_s
    puts "\ndepth pre:"
    print_node_depth_first_preorder(@root)
    puts "\ndepth in:"
    print_node_depth_first_inorder(@root)
    puts "\ndepth post:"
    print_node_depth_first_postorder(@root)
    puts "\nbreadth:"
    print_node_breadth_first(@root)
    puts
  end
  
  def print_node_depth_first_preorder(node)
    return if node.nil? # in case root is nil
    
    print node.value
    print_node_depth_first_preorder(node.left)  if node.left
    print_node_depth_first_preorder(node.right) if node.right
  end
  def print_node_depth_first_inorder(node)
    return if node.nil? # in case root is nil
    
    print_node_depth_first_inorder(node.left)  if node.left
    print node.value
    print_node_depth_first_inorder(node.right) if node.right
  end
  def print_node_depth_first_postorder(node)
    return if node.nil? # in case root is nil
    
    print_node_depth_first_postorder(node.left)  if node.left
    print_node_depth_first_postorder(node.right) if node.right
    print node.value
  end

  def print_node_breadth_first(node)
    return if node.nil?
    
    @q ||= []
    @q << node.left
    @q << node.right
    
    print node.value
    
    print_node_breadth_first(@q.shift)
  end
end

tree = BinaryTree.new
p tree.to_s
