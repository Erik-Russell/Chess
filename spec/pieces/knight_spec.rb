require_relative '../utility.rb'
require_relative '../../lib/pieces/knight.rb'
require_relative '../../lib/chessboard.rb'

describe Knight do
  include Utility

  subject(:white_knight) { Knight.new(:white, [3, 3]) }
  let(:board) { ChessBoard.new }

  before do
    setup_board_with_piece(board, white_knight, [3, 3])
  end

  describe '#valid_moves' do
    it 'returns all valid jump moves as an array' do
      expected_moves = [
        [1, 2], [2, 1],
        [1, 4], [2, 5],
        [5, 2], [4, 1],
        [5, 4], [4, 5]
      ]

      expect(white_knight.valid_moves(board)).to match_array(expected_moves)
    end
  end
end
