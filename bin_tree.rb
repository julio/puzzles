class Node
  attr_reader :value
  attr_reader :right
  attr_reader :left

  def initialize(n)
    @value = n
    @right = Node.new(nil)
    @left  = Node.new(nil)
  end
  
  def self.build_node(n)
  end
end

class Tree
  def self.add(n)
    if @root.nil?
      @root  = Node.new(n)
    else
      if n > @root.value
        @root.right = Node.new(n)
      elsif n < @root.value
        @root.left = Node.new(n)
      end
    end
  end
  
  def self.root
    @root
  end
end

require 'test/unit'

class NodeTest < Test::Unit::TestCase
  def test_should_add_on_empty_tree
    Tree.add(3)
    assert_equal 3, Tree.root.value
  end

  def test_should_insert_to_the_right_if_bigger_than_root
    Tree.add(3)
    Tree.add(4)
    root = Tree.root
    assert_equal 3, root.value # root is still at 3
    assert_equal 4, root.right.value
  end
end
