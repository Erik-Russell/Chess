require_relative 'piece'
require_relative '../chessboard.rb'

class King < Piece
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
      row += dir[0]
      col += dir[1]

      target_piece = board.piece_at([row, col])

      if target_piece == ' ' || target_piece == '.' || target_piece.nil?
        moves << [row, col] # target empty
      elsif target_piece.is_a?(Piece) && target_piece.color != self.color
        moves << [row, col]
      end
    end

    moves
  end

  def can_castle?(board, rook_position)
    puts 'start can castle' # debugging
    return false unless self.previous_position.nil?
    puts 'previous is not nill ####' # debugging

    rook = board.piece_at(rook_position)
    return false unless rook.is_a?(Rook) && rook.previous_position.nil?
    puts 'rooks previous is not nil ####' # debugging

    return false unless clear_between?(board, position, rook_position)
    puts 'clear between is true ####' # debugging

    return false if path_under_attack?(board, position, rook_position)
    puts 'path is not under attack ####' # debugging

    true
  end

  def clear_between?(board, king_pos, rook_pos)
    puts 'start clear between ####' # debugging
    start_col, end_col = [king_pos[1], rook_pos[1]].sort
    puts "start col:#{start_col}, end col:#{end_col} ####" # debugging
    (start_col + 1...end_col).all? do |col|
      puts "checking [#{king_pos[0]}, #{col}] ####" # debugging
      board.piece_at([king_pos[0], col]).nil? || board.piece_at([king_pos[0], col]) == ' ' || board.piece_at([king_pos[0], col]) == '.'
    end
  end

  def path_under_attack?(board, king_pos, rook_pos)
    direction = rook_pos[1] < king_pos[1] ? -1 : 1
    (1..2).any? do |i|
      col = king_pos[1] + (i * direction)
      board.square_under_attack?([king_pos[0], col], self.color)
    end
  end

  def symbol
    if color == :white
      "\u2654"
    else
      "\u265A"
    end
  end
end
