#square => "*"
#interior square => "_"
#flag => "F"

require_relative 'tile'
class Board
  def create(rows, cols, bomb_num)
    tiles = Array.new(bomb_num) {Tile.new(true)} + Array.new(rows*cols-bomb_num) {Tile.new(false)}
    tiles.shuffle!
    grid = Array.new(rows) { 
      Array.new(cols) {tiles.pop}
    }
    assign_position(grid)
    p grid
  end

  def assign_position(grid)
    grid.each_with_index do |row, idx1|
      row.each_with_index do |tile, idx2|
        tile.pos = [idx1, idx2]
      end
    end
  end

  def initialize(rows, cols, bomb_num)
    @grid = create(rows,cols, bomb_num)
  end

  def render

  end

  def neighbors(pos)
    #return array of neighbor tiles
  end

  def finish?

  end
end

board = Board.new(2, 2, 1)
