class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
    @prev, @next = nil, nil
    self

  end
end

class LinkedList

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    j = 0
    each do |node|
      return node if j == i
      j += 1
    end
    nil
  end

  def first
    return @head.next == @tail ? nil : @head.next
  end

  def last
    return @tail.prev == @head ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    node = find_node(key)
    return node.val if node
    nil
  end

  def include?(key)
    return true if find_node(key)
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev.next = node
    @tail.prev = node
    return node
  end

  def update(key, val)
    node = find_node(key)
    node.val = val if node
  end

  def remove(key)
    node = find_node(key)
    node.remove if node
  end

  def find_node(key)
    node = @head
    until node == @tail
      return node if node.key == key
      node = node.next
    end
    nil
  end

  def each
    node = @head.next
    until node == @tail
      yield(node)
      node = node.next
    end

  end

  def map
    result = []
    each do |node|
      result << yield(node)
    end
    result 
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end

  def self.ancestors
    [LinkedList, Object, Kernel, BasicObject, Enumerable]
  end
end
