require 'byebug'
module Sliding
  # HORIZONTAL_DIRS = [:left, :right, :up, :down]
  
  HORIZONTAL_MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }
  
  DIAGONAL_MOVES = {
    left_down: [-1, -1],
    right_up: [1, 1],
    left_up: [1, -1],
    right_down: [-1, 1]  
  }
  
  BOTH = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0],
    left_down: [-1, -1],
    right_up: [1, 1],
    left_up: [1, -1],
    right_down: [-1, 1]  
  }
  def moves
    
    case self.move_dirs
    when :h_v
      build_move(HORIZONTAL_MOVES)
    when :diag
      build_move(DIAGONAL_MOVES)
    when :both
      build_move(BOTH)
    end
  end
  
  private
  def build_move(move_dirs)
    moves = []
    move_dirs.each do |k, v|
      
      # new_pos = self.pos
      diff = v
      new_pos = go_next(self.pos, diff)
  
      while @board.valid_move_pos?(new_pos)
        moves << new_pos 
        new_pos = go_next(new_pos, diff)
      end
      # debugger
      moves << new_pos if @board.valid_cursor_pos?(new_pos) && @color != @board[new_pos].color
    end
    moves
  end
  
  
end