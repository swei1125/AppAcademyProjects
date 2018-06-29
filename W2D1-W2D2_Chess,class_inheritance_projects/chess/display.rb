require_relative 'board'
require 'colorize'
require_relative 'cursor'

class Display
  SYMBOLS = {
    queen: "♛",
    rook: "♜",
    bishop: "♝",
    knight: "♞",
    king: "♚",
    pawn: "♟",
    null: " ",
  }
  attr_reader :cursor, :board
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    puts "\n"
    puts "--------------------------------"
    8.times do |i|
      symbol_arr = []
      @board.grid[i].each_with_index do |piece, j|
        if [i, j] == @cursor.cursor_pos
          symbol_arr << symbolize(piece).colorize(:color => :green, :background => :light_yellow)
        else
          symbol_arr << symbolize(piece).colorize(piece.color)
        end

      end
      puts "| #{symbol_arr.join(" | ")} |"
      puts "---------------------------------"
    end
  end

  def symbolize(piece)
    SYMBOLS[piece.type.downcase.to_sym]
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  
  dup = board.dup 
  
  dis = Display.new(dup)
  # dup.move_piece([0,0], [4,0])
  # dis.render
  # p dup[[4,0]].board[[4,0]].pos
  # p board[[4,0]].type
  # p dup[[4,0]].board[[7,4]].class
  display.render
  board.move_piece([6,5], [5,5])
  board.move_piece([1,4], [3,4])
  board.move_piece([6,7], [4,7])
  board.move_piece([0,3], [4,7])
  board.move_piece([4,7], [5,6])
  # board.move_piece([6,4], [4,4])
  display.render 
  # debugger
  p board[[7, 4]].valid_moves
  p board.checkmate?(:red)
  # p board[[3,4]].moves 
end
