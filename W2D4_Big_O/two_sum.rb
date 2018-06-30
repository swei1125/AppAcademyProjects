
def two_sum_brute_force(arr, target)
  arr.each_with_index do |n, i|
    next if i == arr.length - 1
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort!
  start = 0
  finish = arr.length - 1
  until start == finish
    sum = arr[start] + arr[finish]
    return true if sum == target
    if sum > target
      finish -= 1
    else
      start += 1
    end
  end
  false
end

def two_sum?(arr, target)
  hash = Hash.new(0)
  arr.each do |num|
    hash[num] += 1
  end

  hash.each do |k,_|
    left = target - k
    hash[k] -= 1
    return true if hash.has_key?(left) && hash[left] > 0
    hash[k] += 1
  end
  false
end



arr = [0, 1, 5, 7]
p two_sum_brute_force(arr, 6)
p okay_two_sum?(arr, 6)
p okay_two_sum?(arr, 2)
p two_sum?(arr, 2)
