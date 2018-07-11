def my_min(list)#phase I

  list.each do |n1|
    # min = (n1 < min) ? n1 : min
    min = true
    list.each do |n2|
      min = false if n2 < n1
    end
    return n1 if min == true
  end
end

def better_my_min(list)
  min = list[0]
  list.each do |n1|
    min = (n1 < min) ? n1 : min
  end
  min
end

def sub_sum(arr)
  result = []
  arr.each_index do |i|
    result << [arr[i]]
    (i+1...arr.length).each do |j|
      result << arr[i..j]
    end
  end
  result.map! {|arr| arr.reduce(:+)}
  result.max
end

def better_sub_sum(arr)
  max = arr[0]
  current_sum = arr[0]
  arr.each_with_index do |n, i|
    next if i == 0
    if current_sum < 0
      current_sum = n
    else
      current_sum += n
    end
    max = current_sum > max ? current_sum : max
  end
  max
end




list =[2, 3, -6, 7, -6, 7]
p better_sub_sum(list)
