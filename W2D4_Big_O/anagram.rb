def first_anagram?(str1, str2)
  result = permutation(str1.chars)
  result.map! {|arr| arr.join}
  result.include?(str2)
end

def second_anagram?(str1, str2)
  (0...str1.length).each do |i|
    (0...str2.length).each do |j|
      if(str1[i] == str2[j])
        str1[i] = " "
        str2[j] = " "
      end
    end
  end
  str1.delete(' ') == str2.delete(' ')
end

def third_anagram?(str1, str2)
 str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)
  str1.each_char do |c|
    h1[c] += 1
  end

  str2.each_char do |c|
    h2[c] += 1
  end

  h1.each do |k,v|
    return false if h1[k] != h2[k]
  end
  return true
end

def permutation(arr)
  return [arr] if arr.length <= 1

  last = arr.pop
  prev = permutation(arr)
  result = []
  prev.each do |array|
    (0..array.length).each do |i|
      result << array[0...i] + [last] + array[i..-1]
    end
  end
  result
end


p first_anagram?("gizmo", "sally")
p second_anagram?("abab","bbaa")
p third_anagram?("elvis", "lives")
p fourth_anagram?("elvis", "lives")
