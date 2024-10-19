require_relative 'piece'
require_relative '../chessboard.rb'

class Pawn < Piece
  def valid_moves(board)
    moves = []

    if self.color == :white
      direction = [[-1, 0]]
      attack_direction = [[-1, 1], [-1, -1]]
    else
      direction = [[1, 0]]
      attack_direction = [[1, 1], [1, -1]]
    end

    direction.each do |dir|
      row, col = position
      row += dir[0]

      target_piece = board.piece_at([row, col])

      if target_piece == ' ' || target_piece == '.' || target_piece.nil?
        moves << [row, col]
      end
    end

    attack_direction.each do |a_dir|
      row, col = position
      row += a_dir[0]
      col += a_dir[1]

      target_piece = board.piece_at([row, col])

      if target_piece.is_a?(Piece) && target_piece.color != self.color
        moves << [row, col]
      end
    end

    moves
  end

  def symbol
    if color == :white
      "\u2659"
    else
      "\u265F"
    end
  end
end
