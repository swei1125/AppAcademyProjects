class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each {|el| sum +=  sum ^ el.hash}
    sum
  end
end

class String
  def hash
    arr = self.chars
    letters = ("a".."z").to_a 
    arr.map! {|ch| letters.index(ch)}
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = keys.sort.map {|el| el.to_s if el.is_a?(Symbol)}
    arr.hash
  end
end
