require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      node = @map[key]
      update_node!(node)
      node.val
    else
      calc!(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private
  attr_reader :map, :store
  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    value = @prc.call(key)
    node = @store.append(key, value)
    @map[key] = node
    eject! if count > @max

    node.val
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.remove
    @map[node.key] = @store.append(node.key, node.val)
  end

  def eject!
    node = @store.first
    node.remove
    @map.delete(node.key)

    nil
  end
end
