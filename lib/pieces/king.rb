require_relative 'piece'
require_relative '../chessboard.rb'

class King < Piece
  def valid_moves(board)
    moves = []

    directions = [
      [-1, 0], [-1, 1],
      [0, 1], [1, 1],
      [1, 0], [1, -1],
      [0, -1], [-1, -1]
    ]

    directions.each do |dir|
      row, col = position
      row += dir[0]
      col += dir[1]

      target_piece = board.piece_at([row, col])

      if target_piece == ' ' || target_piece == '.' || target_piece.nil?
        moves << [row, col] # target empty
      elsif target_piece.is_a?(Piece) && target_piece.color != self.color
        moves << [row, col]
      end
    end

    moves
  end

  def symbol
    if color == :white
      "\u2654"
    else
      "\u265A"
    end
  end
end
