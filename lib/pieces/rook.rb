require_relative 'piece'

class Rook < Piece
  def valid_moves
    moves = []

    (0..7).each do |col|
      moves << [position[0], col] unless col == position[1]
    end

    (0..7).each do |row|
      moves << [row, position[1]] unless row == position[0]
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
