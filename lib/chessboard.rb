#
#
require_relative './pieces/rook.rb'
require_relative './pieces/bishop.rb'
require_relative './pieces/knight.rb'
require_relative './pieces/queen.rb'
require_relative './pieces/king.rb'
require_relative './pieces/pawn.rb'
#
class ChessBoard
  attr_reader :board, :last_moved_piece

  def initialize
    @board = Array.new(8) do |row|
      Array.new(8) do |col|
        (row + col).even? ? ' ' : '.'
      end
    end

    place_pieces
    @last_moved_piece = nil
  end

  def display
    puts "\n\n\n    a   b   c   d   e   f   g   h"
    @board.each_with_index do |row, index|
      puts "  +---+---+---+---+---+---+---+---+"
      puts "#{8 - index} | " + row.join(" | ") + " | #{8 - index}"
    end
    puts "  +---+---+---+---+---+---+---+---+"
    puts "    a   b   c   d   e   f   g   h"
  end

  def place_pieces
    # white rooks
    @board[7][0] = Rook.new(:white,[7, 0])
    @board[7][7] = Rook.new(:white,[7, 7])
    # black rooks
    @board[0][0] = Rook.new(:black,[0, 0])
    @board[0][7] = Rook.new(:black,[0, 7])
    # white bishops
    @board[7][2] = Bishop.new(:white,[7, 2])
    @board[7][5] = Bishop.new(:white,[7, 5])
    # black bishops
    @board[0][2] = Bishop.new(:black,[0, 2])
    @board[0][5] = Bishop.new(:black,[0, 5])
    # white knights
    @board[7][1] = Knight.new(:white,[7, 1])
    @board[7][6] = Knight.new(:white,[7, 6])
    # black knights
    @board[0][1] = Knight.new(:black,[0, 1])
    @board[0][6] = Knight.new(:black,[0, 6])
    # white queen
    @board[7][3] = Queen.new(:white,[7, 3])
    # black queen
    @board[0][3] = Queen.new(:black,[0, 3])
    # white king
    @board[7][4] = King.new(:white,[7, 4])
    # black king
    @board[0][4] = King.new(:black,[0, 4])
    # white pawns
    @board[6][0] = Pawn.new(:white, [6, 0])
    @board[6][1] = Pawn.new(:white, [6, 1])
    @board[6][2] = Pawn.new(:white, [6, 2])
    @board[6][3] = Pawn.new(:white, [6, 3])
    @board[6][4] = Pawn.new(:white, [6, 4])
    @board[6][5] = Pawn.new(:white, [6, 5])
    @board[6][6] = Pawn.new(:white, [6, 6])
    @board[6][7] = Pawn.new(:white, [6, 7])
    # black pawns
    @board[1][0] = Pawn.new(:black, [1, 0])
    @board[1][1] = Pawn.new(:black, [1, 1])
    @board[1][2] = Pawn.new(:black, [1, 2])
    @board[1][3] = Pawn.new(:black, [1, 3])
    @board[1][4] = Pawn.new(:black, [1, 4])
    @board[1][5] = Pawn.new(:black, [1, 5])
    @board[1][6] = Pawn.new(:black, [1, 6])
    @board[1][7] = Pawn.new(:black, [1, 7])
  end

  def place_piece(piece, position)
    row, col = position
    @board[row][col] = piece
  end

  def piece_at(position)
    row, col = position
    return nil unless row.between?(0, 7) && col.between?(0, 7)
    @board[row][col]
  end

  def move_piece(position, destination)
    row, col = position
    piece = piece_at(position)
    return unless piece

    @board[row][col] = (row + col).even? ? ' ' : '.'
    piece.move_to(destination)
    place_piece(piece, destination)
    @last_moved_piece = piece
  end

  def can_en_passant?(attacking_pawn, target_position)
    return false if @last_moved_piece.nil?
    return false unless attacking_pawn.is_a?(Pawn)
    return false unless attacking_pawn.color != @last_moved_piece.color

    start_row = @last_moved_piece.color == :white ? 6 : 1
    if @last_moved_piece.previous_position[0] == start_row &&
        (@last_moved_piece.position[0] - @last_moved_piece.previous_position[0]).abs == 2
      puts "attacker:#{attacking_pawn.inspect}\nlast_moved:#{@last_moved_piece.inspect}" # debugging
      return true if attacking_pawn.position[0] == @last_moved_piece.position[0] &&
        (target_position[1] - @last_moved_piece.position[1]).abs == 0
    end

    false
  end

  def square_under_attack?(position, color)
    opposing_color = color == :white ? :black : :white

    @board.each do |row|
      row.each do |piece|
        next if piece.nil? || piece == ' ' || piece == '.' || piece.color == color

        if piece.valid_moves(self).include?(position)
          return true
        end
      end
    end

    false
  end
end
