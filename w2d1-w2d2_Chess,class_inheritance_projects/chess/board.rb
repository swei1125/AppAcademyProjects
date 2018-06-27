require_relative 'piece.rb'
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    set_up
  end
  
  def dup 
    dup_board = Board.new
    
    @grid.each_with_index do |row, i| 
      row.each_with_index do |piece, j|
        case piece.type
        when "Pawn"
          dup_board[[i,j]] = Pawn.new(piece.color, piece.pos, dup_board)
        when "King"
          dup_board[[i,j]] = King.new(piece.color, piece.pos, dup_board)
        when "Queen"
          dup_board[[i,j]] = Queen.new(piece.color, piece.pos, dup_board)
        when "Rook"
          dup_board[[i,j]] = Rook.new(piece.color, piece.pos, dup_board)
        when "Bishop"
          dup_board[[i,j]] = Bishop.new(piece.color, piece.pos, dup_board)
        when "knight"
          dup_board[[i,j]] = Knight.new(piece.color, piece.pos, dup_board)
        else
          dup_board[[i,j]] = NullPiece.instance
        end
      end 
    end 
    dup_board
    
  end 

  def set_up
    set_up_row(:blue, 0, @grid[0])
    @grid[1].map!.with_index { |el, i| Pawn.new(:blue, [1, i], self) }
    @grid[6].map!.with_index { |el, i| Pawn.new(:red, [6, i], self) }
    set_up_row(:red, 7, @grid[7])
  end
  
  def in_check?(color)
    king_pos = find_king(color)
    
    @grid.each do |row|
      row.each do |piece|
        next if piece.is_a?(NullPiece)
        return true if piece.moves.include?(king_pos) && piece.color != color 
      end 
    end 
    false 
          
  end
  
  def checkmate?(color)
    @grid.each do |row|
      row.each do |piece|
        next if piece.color != color
        return false unless piece.valid_moves.empty?
      end
    end
    true
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    unless valid_move?(start_pos, end_pos)
      raise "Invalid move"
    end
    self[end_pos] = self[start_pos]
    self[end_pos].update_pos(end_pos)
    self[start_pos] = NullPiece.instance
  end

  def valid_move?(start_pos, end_pos)
    if start_pos.any? {|n| n < 0 || n > 7}
      raise "Move is not on board"
    elsif end_pos.any? {|n| n < 0 || n > 7}
      raise "Move is not on board"
    elsif self[start_pos].is_a?(NullPiece)
      raise "There is no piece at this starting position"
    end


    return true
  end

  def valid_cursor_pos?(pos)
    return false if pos.any? {|n| n < 0 || n > 7}
    true
  end
  
  def valid_move_pos?(pos)
    return false if pos.any? {|n| n < 0 || n > 7}
    return false unless self[pos].is_a?(NullPiece)
    true
  end
  private
  
  def find_king(color)
    king_pos = nil
    @grid.each do |row|
      row.each do |el|
        king_pos = el.pos if el.is_a?(King) && el.color == color
        break if king_pos
      end 
    end 
    king_pos
  end

  def set_up_row(color, row_idx, row)
    row.each_index do |i|
      if i == 0 || i == 7
        row[i] = Rook.new(color, [row_idx, i], self)
      elsif i == 1 || i == 6
        row[i] = Knight.new(color, [row_idx, i], self)
      elsif i == 2 || i == 5
        row[i] = Bishop.new(color, [row_idx, i], self)
      elsif i == 3
        row[i] = Queen.new(color, [row_idx, i], self)
      else
        row[i] = King.new(color, [row_idx, i], self)
      end
    end
  end
end
