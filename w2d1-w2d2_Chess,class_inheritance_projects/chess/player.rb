require 'byebug'
class HumanPlayer
  
  def initialize(color, display)
    @color = color
    @display = display
  end
  
  def make_move(board)
    moved = nil 
    until moved == :move
      @display.render
      moved = @display.cursor.get_input
      start_pos = @display.cursor.cursor_pos
      # debugger
    end
    moved = nil
    until moved == :move
      @display.render
      moved = @display.cursor.get_input
      end_pos = @display.cursor.cursor_pos
    end
    board.move_piece(start_pos, end_pos)
  end
end