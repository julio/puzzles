class Node
  attr_reader :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end

  def next=(node)
    @next = node
  end
end

class Stack
  def initialize
    @top = nil
  end

  def pop
    return unless @top

    value = @top.value
    @top = @top.next
    value
  end

  def push(value)
    if @top
      old_top = @top
    end
    @top = Node.new(value)
    @top.next = old_top
  end

  def to_a
    array = []
    node = @top
    while node
      array << node.value
      node = node.next
    end
    array
  end

  def length
    l = 0
    node = @top
    while node
      l += 1
      node = node.next
    end
    l
  end
end

require 'test/unit'

class StackTest < Test::Unit::TestCase
  def test_pop_from_empty
    s = Stack.new
    assert_nil s.pop
  end

  def test_pop_from_single_push
    s = Stack.new
    s.push(1)
    assert_equal 1, s.pop
  end

  def test_pop_pop_is_nil
    s = Stack.new
    s.push(1)
    assert_equal 1, s.pop
    assert_nil s.pop
  end

  def test_length
    s = Stack.new
    assert_equal 0, s.length
    s.push 1
    assert_equal 1, s.length
    s.push 1
    assert_equal 2, s.length
    s.pop
    assert_equal 1, s.length
    s.pop
    assert_equal 0, s.length
  end

  def test_to_a
    s = Stack.new
    s.push 1
    s.push 2
    s.push 3
    s.push 5

    assert_equal([5,3,2,1], s.to_a)

    s.pop
    assert_equal([3,2,1], s.to_a)
  end
end
