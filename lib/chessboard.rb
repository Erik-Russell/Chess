#
#
require_relative './pieces/rook.rb'
require_relative './pieces/bishop.rb'
require_relative './pieces/knight.rb'
require_relative './pieces/queen.rb'
require_relative './pieces/king.rb'
#
class ChessBoard
  attr_reader :board

  def initialize
    @board = Array.new(8) do |row|
      Array.new(8) do |col|
        (row + col).even? ? ' ' : '.'
      end
    end

    place_pieces
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
    # white bishops
    @board[7][1] = Knight.new(:white,[7, 1])
    @board[7][6] = Knight.new(:white,[7, 6])
    # black bishops
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
  end

  def place_piece(piece, position)
    row, col = position
    @board[row][col] = piece
  end

  def piece_at(position)
    row, col = position
    @board[row][col]
  end
end
