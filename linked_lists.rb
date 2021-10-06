class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    @tail.next_node = new_node if @tail
    @tail = new_node
    @head = new_node unless @head
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head if @head
    @head = new_node
    @tail = new_node unless @tail
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
    if index < self.size
      index.times { node = node.next_node }
    end
    node
  end

  def pop
    return if @head.nil?

    if self.size == 1
      @head = nil
      @tail = nil
    else
      node = self.at(self.size - 1)
      node = nil
      @tail = self.at(self.size - 2)
      @tail.next_node = nil
    end
  end

  def contains?(value)
    return if @head.nil?

    node = @head
    self.size.times do
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def find(value)
    return if @head.nil?

    node = @head
    self.size.times do |idx|
      return idx if node.value == value
      node = node.next_node
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
    if index <= size
      new_node = Node.new value
      @list = @list[0...index].push(new_node) + @list[index..-1]
      @list[index - 1].next_node = @list[index] unless index == 0
      @list[index].next_node = index == size - 1 ? nil : @list[index + 1]
    end
  end

  def remove_at(index)
    if index < size
      if index == size - 1
        pop
        @list[-1].next_node = nil
        return
      end
      @list = @list[0...index] + @list[index + 1..-1]
      @list[index - 1].next_node = @list[index] unless index == 0
      @list[index].next_node = @list[index + 1]
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
# p l
# p l.size
# p l.head
# p l.tail
# p l.at(1)
l.pop
p l
p l.contains?(2)
p l.find(1)
# l.insert_at(5, 2)
# l.remove_at(2)
# l.to_s
# p l
