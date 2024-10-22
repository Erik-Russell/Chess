require_relative '../../lib/chessboard.rb'
require_relative '../../lib/pieces/pawn.rb'

describe Pawn do
  let(:board) { ChessBoard.new }

  context "when performing en passant" do
    it "allows en passant when the conditions are met" do
      # Setup: white pawn on e5, Black pawn moves from d7 to d5
      white_pawn = board.piece_at([6, 4])

      board.move_piece([6, 4], [3, 4])

      # Move black pawn from d7 to d5
      board.move_piece([1, 3], [3, 3])

      board.display

      puts white_pawn.inspect

      puts "lp:#{board.last_moved_piece}"
      # Check white can perform en passant
      expect(white_pawn.valid_moves(board)).to include([2, 3])
    end
  end
end
