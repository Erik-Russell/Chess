module Utility
  def setup_board_with_piece(board, piece, position)
    # clear board
    board.board.each { |row| row.map! { ' ' } }

    # place piece at position
    board.place_piece(piece, position)

    # show board
    board.display
  end
end
