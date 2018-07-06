require_relative 'display.rb'
require_relative 'player.rb'

class Game
  attr_reader :board, :display, :player1, :player2, :current_player
  
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 = HumanPlayer.new(:blue, @display)
    @player2 = HumanPlayer.new(:red, @display)
    @current_player = @player1
  end
  
  def play
    while true
      @current_player.make_move(@board)
      swap_turn!
    end
  end
  
  private
  
  def swap_turn!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end