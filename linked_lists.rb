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
    @list[0]
  end

  def tail
    @list[-1]
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
    @list[-1].next_node = nil unless @list.empty?
  end

  def contains?(value)
    @list.any? { |node| node.value == value }
  end

  def find(value)
    @list.each_with_index do |node, idx|
      return idx if node.value == value
    end
    nil
  end

  def to_s
    @list.each do |node|
      print "( #{node.value} ) -> "
    end
    puts 'nil'
  end

  def insert_at(value, index)
    if index < size
      new_node = Node.new value
      @list = @list[0...index].push(new_node) + @list[index..-1]
      @list[index - 1].next_node = @list[index] unless index == 0
      @list[index].next_node = @list[index + 1] unless index == size - 1
    end
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
l.pop
p l.contains?(1)
p l.find(3)
l.insert_at(5, 0)
l.to_s
p l
