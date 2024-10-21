require_relative 'piece'
require_relative '../chessboard.rb'

class Pawn < Piece
  def valid_moves(board)
    moves = []

    if self.color == :white
      direction = [[-1, 0]]
      starting_row = 6
    else
      direction = [[1, 0]]
      starting_row = 1
    end

    # Normal Move
    forward_position = [row + direction, col]
    target_piece = board.piece_at(forward_position)

    if target_piece.nil?
      moves << forward_position

      # Double move from starting position
      if row == starting_row
        double_forward_position = [row + (2 * direction), col]
        if board.piece_at(double_forward_position).nil?
          moves << double_forward_position
        end
      end
    end

    # Attack Move
    attack_directions = [
      [direction, 1], [direction, -1]
    ]
    attack_directions.each do |a_dir|
      attack_row = row + a_dir[0]
      attack_col = col + a_dir[1]
      target_piece = board.piece_at([attack_row, attack_col])

      if target_piece.is_a?(Piece) && target_piece.color != self.color
        moves << [attack_row, attack_col]
      end
    end

    moves
  end

  def symbol
    color == :white ? "\u2659" : "\u265F"
  end
end
