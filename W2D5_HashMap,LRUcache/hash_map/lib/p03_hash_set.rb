class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    num = key.hash 
    return false if include?(key)
    self[num] << key
    @count += 1
    return true
  end

  def include?(key)
    num = key.hash
    self[num].include?(key)
  end

  def remove(key)
    num = key.hash
    return false unless include?(key)
    self[num].delete(key) 
    @count -= 1 
    return true
  end

  private

  def [](num)
    @store[num % num_buckets]# optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    store1 = Array.new(num_buckets * 2) {Array.new}
    @store.each do |arr|
      arr.each do |el| 
        store1[el % (num_buckets * 2)] << el 
      end 
    end 
    @store = store1
  end
end
