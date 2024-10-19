require_relative '../utility.rb'
require_relative '../../lib/pieces/king.rb'
require_relative '../../lib/chessboard.rb'

describe King do
  include Utility

  subject(:white_king) { King.new(:white,[3, 3]) }
  let(:board) { ChessBoard.new }

  before do
    setup_board_with_piece(board, white_king, [3, 3])
  end

  describe '#valid_moves' do
    it 'returns all valid one-step moves' do
      expected_moves = [
        [2, 3], [2, 4], [3, 4], [4, 4],
        [4, 3], [4, 2], [3, 2], [2, 2]
      ]

      expect(white_king.valid_moves(board)).to match_array(expected_moves)
    end
  end
end
