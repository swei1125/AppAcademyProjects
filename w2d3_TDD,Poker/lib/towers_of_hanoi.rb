class Hanoi
  attr_reader :piles

  def initialize
    @piles = Array.new(3) { Array.new}
    setup(@piles)
  end

  def setup(array)
    @piles[0] = [1, 2, 3]
    @piles
  end

  def get_input
    numbers = %w(1 2 3)
    pile_index = gets.chomp
    raise "Sorry, that is not a valid number.  Try again." unless numbers.include?(pile_index)
    pile_index.to_i - 1
  end

  def move(start_pos, end_pos)
    if @piles[end_pos].empty? && @piles[start_pos].length > 0
      @piles[end_pos] << @piles[start_pos].shift
    else
      if @piles[start_pos][0] < @piles[end_pos][0]
        @piles[end_pos].unshift(@piles[start_pos].shift)
      end
    end
  end

  def won?
    return false unless @piles[0].empty?
    return true if @piles[1] == [1, 2, 3] || @piles[2] == [1, 2, 3]
    false
  end

  def play
    p "Welcome to the best Towers of Hanoi game ever!"
    until won?
      p "Please choose a pile that you want to move from"
      start_pos = get_input
      p "Please choose a pile that you want to move to"
      end_pos = get_input
      move(start_pos, end_pos)
    end
    p "Congrats, you win!!!"
  end
end
