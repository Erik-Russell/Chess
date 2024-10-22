require_relative 'piece'
require_relative '../chessboard.rb'

class Pawn < Piece
def valid_moves(board)
    moves = []

    direction = self.color == :white ? -1 : 1
    start_row = self.color == :white ? 6 : 1
    attack_directions = [[direction, -1], [direction, 1]]

    # Normal move
    forward_move = [position[0] + direction, position[1]]
    if board.piece_at(forward_move) == ' ' || board.piece_at(forward_move) == '.'
      moves << forward_move
      # Check for two-square move from the starting position
      if position[0] == start_row
        double_forward_move = [position[0] + (2 * direction), position[1]]
        if board.piece_at(double_forward_move) == ' ' || board.piece_at(double_forward_move) == '.'
          moves << double_forward_move
        end
      end
    end

    # Attack moves and en passant check
    attack_directions.each do |dir|
      puts 'attack check' # debugging
      attack_position = [position[0] + dir[0], position[1] + dir[1]]
      target_piece = board.piece_at(attack_position)

      if target_piece.is_a?(Piece) && target_piece.color != self.color
        moves << attack_position
      end

      # En Passant Check
      if board.can_en_passant?(self, attack_position)
        moves << attack_position

        puts 'en passant' # debugging

      end
    end

    moves
  end
  def symbol
    color == :white ? "\u2659" : "\u265F"
  end
end
