#
#
require_relative './chessboard.rb'
#
class Chess
  attr_reader :board

  def initialize
    @board = ChessBoard.new
  end

  def player_move(position, destination)
    # get valid moves
    piece = @board.piece_at(position)
    moves = piece.valid_moves(@board)
    # move piece
    if moves.include?(destination)
      @board.move_piece(position, destination)
    else
      puts "Invalid move. Please try again"
    end
  end
end
