require_relative '../utility.rb'
require_relative '../../lib/pieces/pawn.rb'
require_relative '../../lib/chessboard.rb'

describe Pawn do
  include Utility

  subject(:white_pawn) { Pawn.new(:white,[3, 3]) }
  let(:board) { ChessBoard.new }

  context 'white pawn moves down' do
    before do
      setup_board_with_piece(board, white_pawn, [3, 3])
    end


    describe '#valid_moves' do
      it 'returns valid moves as an array' do
        white_moves = [
          [2, 3]
        ]
        expect(white_pawn.valid_moves(board)).to match_array(white_moves)
      end
    end
  end

  context 'black pawn moves up' do
    subject(:black_pawn) { Pawn.new(:black,[3, 3]) }

    before do
      setup_board_with_piece(board, black_pawn, [3, 3])
    end

    describe '#valid_moves' do
      it 'returns valid moves as an array' do
        black_moves = [
          [4, 3]
        ]
        expect(black_pawn.valid_moves(board)).to match_array(black_moves)
      end
    end
  end
end
