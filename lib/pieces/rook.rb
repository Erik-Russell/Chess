require_relative 'piece'
require_relative '../chessboard'

class Rook < Piece
  def valid_moves(board)
    moves = []

    directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

    directions.each do |dir|
      row, col = position
      loop do
        row += dir[0]
        col += dir[1]
        break unless row.between?(0, 7) && col.between?(0, 7) # stay on board

        target_piece = board.piece_at([row, col])

        if target_piece == ' ' || target_piece == '.' || target_piece.nil?
          moves << [row, col] # empty squares ==> valid
        elsif target_piece.is_a?(Piece) && target_piece.color != self.color
          moves << [row, col] # opponenet color
          break               # go no further
        else
          break # 
        end
      end
    end
    
    moves
  end

  def symbol
    if color == :white
      "\u2656"
    else
      "\u265C"
    end
  end
end
