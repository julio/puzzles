require "./node"

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
    @last_node = nil
  end

  def length
    raise "The list has a cycle." if circular?

    l = 0
    current = @head
    while current
      l += 1
      current = current.next
    end
    l
  end

  def add(node)
    if @head.nil?
      @head      = node
      @last_node = @head
    else
      @last_node.next = node
      @last_node      = node
    end
  end

  def circular?
    return false if @head.nil? || @head.next.nil?

    slow = @head
    fast = @head.next unless @head.nil?
    begin
      return false if slow.nil? || fast.nil? || fast.next.nil?
      return true if slow == fast # bang!

      slow = slow.next
      fast = fast.next.next
    end until fast.nil?
  end
end
