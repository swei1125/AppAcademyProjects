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
    
    if @next != nil && @prev != nil 
      @next.prev = @prev 
      @prev.next = @next 
      
    elsif @next.nil? && @prev != nil
      @prev.next = nil 
    elsif @prev.nil? && @next != nil 
      @next.prev = nil 
    end 
  end
end

class LinkedList
  def initialize
    @list = []
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @list.first
  end

  def last
    @list.last
  end

  def empty?
    @list.length == 0
  end

  def get(key)
    node = @list.find {|nd| nd.key == key}
    return node.val if node
    nil
  end

  def include?(key)
    
  end

  def append(key, val)
    @list << Node.new(key, val)
  end

  def update(key, val)
    node = @list.find {|nd| nd.key == key}
    unless node.nil?
      node.val = val 
    end
  end

  def remove(key)
    node = @list.find {|nd| nd.key == key}
    unless node.nil?
      node.remove 
      node.val = nil
      @list.delete(node)
    end 
    
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
