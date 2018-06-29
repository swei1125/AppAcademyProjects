module Stepping
  
  def moves 
    moves = []
    @move_dirs.each do |diff|
      new_pos = go_next(@pos, diff)
      # moves << new_pos if @board.valid_move_pos?(new_pos)
      moves << new_pos if @board.valid_cursor_pos?(new_pos) && @color != @board[new_pos].color
    end 
    moves 
  end 
  
  
end