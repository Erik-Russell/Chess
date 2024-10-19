require_relative 'piece'
require_relative '../chessboard.rb'

class Knight < Piece
  def valid_moves(board)
    moves = []

    directions = [
      [1, 2], [2, 1],
      [1, -2], [2, -1],
      [-1, 2], [-2, 1],
      [-1, -2], [-2, -1]
    ]

    directions.each do |dir|
      row, col = position
      row += dir[0]
      col += dir[1]
      
      target_piece = board.piece_at([row, col])

      if target_piece == ' ' || target_piece == '.' || target_piece.nil?
        moves << [row, col] # target is empty
      elsif target_piece.is_a?(Piece) && target_piece.color != self.color
        moves << [row, col]
      end
    end

    moves
  end

  def symbol
    if color == :white
      "\u2658"
    else
      "\u265E"
    end
  end
end
