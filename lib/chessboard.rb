#
#
require_relative './pieces/rook.rb'
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
  end

  def piece_at(position)
    row, col = position
    @board[row][col]
  end
end
