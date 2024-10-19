require_relative '../utility.rb'
require_relative '../../lib/pieces/bishop.rb'
require_relative '../../lib/chessboard.rb'

describe Bishop do
  include Utility

  subject(:white_bishop) { Bishop.new(:white, [3, 3]) }
  let(:board) { ChessBoard.new }

  before do
    setup_board_with_piece(board, white_bishop, [3, 3])
  end

  describe '#valid_moves' do
    it 'returns all valid diagonal moves as an array' do
      expected_moves = [
        [2, 2], [1, 1], [0, 0],        # up-left
        [2, 4], [1, 5], [0, 6],        # up-right
        [4, 2], [5, 1], [6, 0],        # down-left
        [4, 4], [5, 5], [6, 6], [7, 7] # down-right
      ]

      expect(white_bishop.valid_moves(board)).to match_array(expected_moves)
    end
  end
end
