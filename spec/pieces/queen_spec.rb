require_relative '../utility.rb'
require_relative '../../lib/pieces/queen.rb'
require_relative '../../lib/chessboard.rb'

describe Queen do
  include Utility

  subject(:white_queen) { Queen.new(:white,[3, 3]) }
  let(:board) { ChessBoard.new }

  before do
    setup_board_with_piece(board, white_queen, [3, 3])
  end

  describe '#valid_moves' do
    it 'returns all valid horizontal, vertical, and diagonal moves as an array' do
      expected_moves = [
        [2, 3], [1, 3], [0, 3], # up
        [2, 4], [1, 5], [0, 6], # up-right
        [3, 4], [3, 5], [3, 6], [3, 7], # right
        [4, 4], [5, 5], [6, 6], [7, 7], # down-right
        [4, 3], [5, 3], [6, 3], [7, 3], # down
        [4, 2], [5, 1], [6, 0], # down-left
        [3, 2], [3, 1], [3, 0], # left
        [2, 2], [1, 1], [0, 0], # up-left
      ]

      expect(white_queen.valid_moves(board)).to match_array(expected_moves)
    end
  end
end

