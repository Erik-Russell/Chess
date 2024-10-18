require_relative '../../lib/pieces/rook.rb'
require_relative '../../lib/chessboard.rb'

describe Rook do
  subject(:white_rook) { Rook.new(:white,[7,0]) }
  let(:board) { ChessBoard.new }

  describe '#valid_moves' do
    it 'returns all valid horizontal and vertical moves as an array' do
      expected_moves = [
        [6, 0], [5, 0], [4, 0], [3, 0], [2, 0], [1, 0], [0, 0],  # Up (north)
        [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6],          # Right (east)  
      ]

      expect(white_rook.valid_moves(board)).to match_array(expected_moves)
    end
  end
end
