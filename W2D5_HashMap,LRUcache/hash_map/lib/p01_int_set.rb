class MaxIntSet
  def initialize(max)
    @max = max 
    @store = Array.new(@max) {false}
  end

  def insert(num)
    raise_error unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise_error unless is_valid?(num)
    @store[num] = false if include?(num)
  end

  def include?(num)
    raise_error unless is_valid?(num)
    @store[num]
  end

  private
  def raise_error 
    raise "Out of bounds"
  end
  
  def is_valid?(num)
    num.between?(0,@max)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]# optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets 
    unless include?(num)
      self[num] << num
      @count += 1
    end 
  end

  def remove(num)
    if include?(num)
      self[num].delete(num) 
      @count -= 1 
    end 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
