class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    each_index do |i|
      next if i == length - 1
      (i+1...length).each do |j|
        result << [i,j] if self[i] + self[j] == 0
      end
    end
    result
  end
end

def my_transpose(arr)
  length = arr[0].length
  result = Array.new(length) { Array.new(arr.length) }
  arr.each_index do |i|
    arr[0].each_index do |j|
      result[i][j] = arr[j][i]
    end
  end

  result
end

def stock_picker(arr)
  buy = arr.max
  profit = 0
  result = []
  arr.each_with_index do |price, day|
    if price < buy
      buy = price
    else
      if (price - buy) > profit
        profit = price - buy
        result << arr.index(buy)
        result << day
      end
    end
  end
  result
end
