#
#
require_relative '../lib/chess.rb' 
#
#
describe Chess do
  describe '#initialize' do
    subject(:game) { Chess.new }

    it 'creates a new instance' do
      expect(game).to be_an_instance_of(Chess)
    end

    it 'creates a new chessboard' do
      expect(game.board).to be_an_instance_of(ChessBoard)
    end

  end

  describe '#player_move' do
    subject(:game) { Chess.new }

    it 'makes an array of valid_moves' do
      position = [7, 1] # white queen's knight
      expected_moves = [
        [5, 0], [5, 2]
      ]

      expect(game.player_move(position)).to match_array(expected_moves)
    end
  end

end
