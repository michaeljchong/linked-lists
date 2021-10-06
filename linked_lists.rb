class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new value
    @tail.next_node = new_node if @tail
    @tail = new_node
    @head ||= new_node
  end

  def prepend(value)
    new_node = Node.new value
    new_node.next_node = @head if @head
    @head = new_node
    @tail ||= new_node
  end

  def size
    size = 0
    node = @head
    loop do
      node ? size += 1 : break
      node = node.next_node
    end
    size
  end

  def at(index)
    node = @head
    index.times { node = node.next_node } if index < size
    node
  end

  def pop
    return if @head.nil?

    if size == 1
      @head = nil
      @tail = nil
    else
      @tail = at(size - 2)
      @tail.next_node = nil
    end
  end

  def contains?(value)
    return if @head.nil?

    node = @head
    size.times do
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    return if @head.nil?

    node = @head
    size.times do |idx|
      return idx if node.value == value

      node = node.next_node
    end
    nil
  end

  def to_s
    return if @head.nil?

    node = @head
    size.times do
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    puts 'nil'
  end

  def insert_at(value, index)
    if index.zero?
      prepend(value)
      return
    end
    if index == size
      append(value)
      return
    end
    return unless index < size

    at_index = at(index)
    new_node = Node.new value
    new_node.next_node = at_index
    before_index = at(index - 1)
    before_index.next_node = new_node
  end

  def remove_at(index)
    if index == size - 1 || size == 1
      pop
      return
    end
    if index.zero?
      @head = @head.next_node
      return
    end
    return unless index < size

    at_index = at(index)
    after_index = at_index.next_node
    before_index = at(index - 1)
    before_index.next_node = after_index
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

# Test cases
l = LinkedList.new
l.append(1)
l.append(2)
l.prepend(3)
l.to_s
puts "Size: #{l.size}"
puts "Head: #{l.head.value}"
puts "Tail: #{l.tail.value}"
puts "At index 1: #{l.at(1).value}"
l.pop
l.to_s
puts "Contains 2? #{l.contains?(2)}"
puts "Find index of 1: #{l.find(1)}"
l.insert_at(5, 1)
l.to_s
l.remove_at(0)
l.to_s
