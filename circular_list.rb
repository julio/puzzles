# ---------------------------------------------------------------------------
# Is the linked list, circular?
# ---------------------------------------------------------------------------

class Node
  attr_accessor :next
  attr_reader :value
  
  def initialize(value)
    @value = value
    @next  = nil
  end
end

class List
  attr_reader :head
  def initialize(elements)
    @head = Node.new(elements[0])
    current = @head
    elements.shift
    elements.each do |e|
      node = Node.new(e)
      current.next = node
      current = node
    end
    
    # bug => circular list
    current.next = @head
  end
end

def circular?(list_head)
  slow = list_head
  fast = list_head.next unless list_head.nil?
  begin
    return false if slow.nil? || fast.nil? || fast.next.nil?
    return true if slow == fast
    slow = slow.next
    fast = fast.next.next
  end until (slow.nil? || fast.nil?)
end

list = List.new(%w{q w e r t y})
p circular?(list.head)
p circular?(nil)
