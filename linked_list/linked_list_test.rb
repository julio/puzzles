require "test/unit"
require "./linked_list"

class LinkedListTest < Test::Unit::TestCase
  def test_should_be_0_nodes_long_if_empty
    assert_equal 0, LinkedList.new.length
  end

  def test_should_know_the_length_if_not_circular
    list = LinkedList.new
    list.add(Node.new("a"))
    assert !list.circular?
    assert_equal 1, list.length

    list.add(Node.new("b"))
    assert !list.circular?
    assert_equal 2, list.length

    list.add(Node.new("a"))
    assert !list.circular?
    assert_equal 3, list.length

    list.add(Node.new("d"))
    assert !list.circular?
    assert_equal 4, list.length
  end

  def test_should_raise_exception_when_getting_length_if_circular
    list = make_bad_list(30, 20)

    assert_raises RuntimeError do
      assert_equal 4, list.length
    end
  end

  # Not circular (good list)
  def test_should_not_be_circular_if_only_one_node
    list = LinkedList.new
    list.add(Node.new("a"))

    assert !list.circular?
  end

  def test_should_not_be_circular_if_no_nodes
    assert !LinkedList.new.circular?
  end

  def test_should_not_be_circular_if_no_cycles
    list = LinkedList.new

    node_1 = Node.new("a")
    node_2 = Node.new("a")
    node_3 = Node.new("a")
    node_4 = Node.new("a")

    list.add(node_1)
    list.add(node_2)
    list.add(node_3)
    list.add(node_4)

    assert_equal 4, list.length

    assert !list.circular?
  end

  def test_should_be_circular_if_node_links_to_itself
    assert make_bad_list(3, 3).circular?
  end

  def test_should_be_circular_if_node_links_to_previous
    assert make_bad_list(3, 2).circular?
  end

  def test_should_be_circular_if_node_links_to_odd_number_of_nodes_in_past
    assert make_bad_list(30, 21).circular?
  end

  def test_should_be_circular_if_node_links_to_even_number_of_nodes_in_past
    assert make_bad_list(30, 20).circular?
  end

  def test_should_be_circular_if_last_node_points_to_first
    assert make_bad_list(99, 0).circular?
  end

  private

  def make_bad_list(from, to)
    list = LinkedList.new

    nodes = []
    100.times do |i|
      list.add(nodes[i] = Node.new("a"))
    end
    nodes[from].next = nodes[to] # oops!

    list
  end
end
