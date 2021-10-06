class LinkedList
  def initialize
    @list = []
  end

  def append(value)
    @list.push Node.new(value)
    @list[-2].next_node = @list[-1] if size > 1
  end

  def prepend(value)
    @list.unshift Node.new(value)
    @list[0].next_node = @list[1] if size > 1
  end

  def size
    @list.length
  end

  def head

  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

l = LinkedList.new
l.append(1)
l.append(2)
l.prepend(3)
p l
