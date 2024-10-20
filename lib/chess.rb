#
#
require_relative './chessboard.rb'
#
class Chess
  attr_reader :board

  def initialize
    @board = ChessBoard.new
  end

  def player_move(position)
    ## row, col = position
    # if valid_move
    piece = @board.piece_at(position)
    moves = piece.valid_moves(@board)
    # move_piece
  end
end
