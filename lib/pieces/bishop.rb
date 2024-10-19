require_relative 'piece'
require_relative '../chessboard'

class Bishop < Piece
  def valid_moves(board)
    moves = []

    directions = [
      [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]

    directions.each do |dir|
      row, col = position
      loop do
        row += dir[0]
        col += dir[1]
        break unless row.between?(0, 7) && col.between?(0, 7) # stay on board

        target_piece = board.piece_at([row, col])

        if target_piece == ' ' || target_piece == '.' || target_piece.nil?
          moves << [row, col] # target is empty
        elsif target_piece.is_a?(Piece) && target_piece.color != self.color
          moves << [row, col] # target is enemy
          break
        else
          break
        end
      end
    end

    moves
  end

  def symbol
    if color == :white
      "\u2657"
    else
      "\u265D"
    end
  end
end
