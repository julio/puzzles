class Tree
  attr_accessor :name, :children
  
  def initialize(name, children=[])
    @name     = name
    @children = children
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
      block.call self
  end
end

tree = Tree.new("1", [
  Tree.new("10", [Tree.new("100"), Tree.new("101")]),
  Tree.new("20", [Tree.new("200"), Tree.new("201")])])
  
tree.visit_all {|n| p n.name}