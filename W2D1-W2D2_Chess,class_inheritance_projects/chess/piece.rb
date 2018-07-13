require 'Singleton'
require 'colorize'
require_relative 'stepping_module'
require_relative 'sliding_module'

class Piece
  attr_accessor :type, :move_dirs, :color, :pos, :board

  def initialize(color, pos, board, type)
    @color = color
    @pos = pos
    @board = board
    @type = type
  end
  
  def update_pos(end_pos)
    @pos = end_pos
  end
  
  def go_next(pos, move)
    new_pos = []
    (0..1).each {|i| new_pos << pos[i] + move[i]}
    new_pos
  end 
  
  def valid_moves
    valid_moves = []
    possible_moves = moves
    possible_moves.each do |move|
      valid_moves << move unless move_into_check?(move)
    end
    
    valid_moves
  end
  
  def move_into_check?(end_pos)
    duped_board = @board.dup
    duped_board.move_piece(@pos, end_pos)
    duped_board.in_check?(@color)
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    @type = "Null"
  end
end

class Pawn < Piece
  def initialize(color, pos, board)
    super(color, pos, board, "Pawn")
  end
  
  def moves 
    forward_steps + side_attacks
    
  end 
  # private
  def forward_steps
    possible_moves = []
    
    new_pos = go_next(@pos, [forward_dir, 0])
    if @board.valid_move_pos?(new_pos)
      possible_moves << new_pos 
      
      new_pos = go_next(@pos, [forward_dir*2, 0])
      if at_start_row? && @board.valid_move_pos?(new_pos)
        possible_moves << new_pos 
      end 
    end 
    possible_moves
  end
  require 'byebug'
  def side_attacks
    # debugger
    possible_moves = [] 
    [-1, 1].each do |col_move|
      new_pos = go_next(@pos, [forward_dir, col_move])
      next unless @board.valid_cursor_pos?(new_pos)
      unless @board[new_pos].is_a?(NullPiece) || @color == @board[new_pos].color
        possible_moves << new_pos
      end
    end
    possible_moves 
  end
  def at_start_row?
    return true if @color == :blue && pos[0] == 1
    return true if @color == :red && pos[0] == 6
    return false 
  end
  def forward_dir
    return 1 if @color == :blue 
    return -1 if @color == :red 
  end
end

class King < Piece
  include Stepping
  
  def initialize(color, pos, board)
    @move_dirs = [
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1],
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0]
    ]
    super(color, pos, board, "King")
  end
  
  # def valid_moves
  #   valid_moves = []
  # 
  #   moves.each do |move|
  #     valid_moves << move unless move_into_check?(move)
  #   end
  # 
  #   valid_moves
  # end
end

class Queen < Piece #King/Knight
  include Sliding

  def initialize(color, pos, board)
    super(color, pos, board, "Queen")
    @move_dirs = :both
  end
end

class Rook < Piece
  include Sliding

  def initialize(color, pos, board)
    super(color, pos, board, "Rook")
    @move_dirs = :h_v
  end
  
end

class Bishop < Piece
  include Sliding

  def initialize(color, pos, board)
    super(color, pos, board, "Bishop")
    @move_dirs = :diag
  end
end

class Knight < Piece
  include Stepping

  
  def initialize(color, pos, board)
    @move_dirs = [
      [-2, -1],
      [-2, 1],
      [1, -2],
      [1, 2],
      [2, 1],
      [2, -1],
      [-1, 2],
      [-1, -2]
    ]
    super(color, pos, board, "knight")
  end
end
