# 1790656578

class Node
  attr_accessor :left, :right, :data
  
  def initialize(data)
    @data = data
  end
end

class Tree
  attr_accessor :root
  
  # ---------------------------------------------------------------------------
  def initialize(numbers)
    @numbers = numbers

    numbers.each do |n|
      insert(n)
    end
  end
  
  # ---------------------------------------------------------------------------
  def inorder_print(node)
    if node.nil?
      return
    end
    
    inorder_print(node.left) if node.left
    print "[#{node.data}]"
    inorder_print(node.right) if node.right
  end
  
  # ---------------------------------------------------------------------------
  def insert(n)
    node = Node.new(n)
    if @root.nil?
      @root = node
    else
      _insert(@root, node)
    end
  end
  
  private # -----
  
  # ---------------------------------------------------------------------------
  def _insert(root, node)
    if node.data > root.data
      if root.right.nil?
        root.right = node
      else
        _insert(root.right, node)
      end
    else
      if root.left.nil?
        root.left = node
      else
        _insert(root.left, node)
      end
    end
  end
end

t = Tree.new([12,3,4,7,11,2,1,5,6,8,9,10])

t.inorder_print(t.root)
