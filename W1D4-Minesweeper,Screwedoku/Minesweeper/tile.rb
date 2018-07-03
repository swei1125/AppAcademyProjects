#square => "*"
#interior square => "_"
#flag => "F"

class Tile
  attr_reader :bomb ,:flagged
  attr_accessor :pos
  def initialize(bomb)
    @bomb = bomb
    @flagged = false 
    @reveal = false 
  end
  
  def revealed?
    @reveal 
  end
  
  def reveal
    @reveal = true
  end
  
  def neighbors?(board)
    board.neighbors(@pos)
  end
  
  def neighbor_bomb_count(board)
    neighbor_arr = neighbors?(board)
    neighbor_arr.count {|tile| tile.bomb}
  end

end 
