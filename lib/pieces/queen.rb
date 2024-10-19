require_relative 'piece'
require_relative '../chessboard.rb'

class Queen < Piece
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
      loop do
        row += dir[0]
        col += dir[1]
        break unless row.between?(0, 7) && col.between?(0, 7) # stay on board

        target_piece = board.piece_at([row, col])

        if target_piece == ' ' || target_piece == '.' || target_piece.nil?
          moves << [row, col] # when target is empty
        elsif target_piece.is_a?(Piece) && target_piece.color != self.color
          moves << [row, col] # when target is an enemy
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
      "\u2655"
    else
      "\u265B"
    end
  end
end
