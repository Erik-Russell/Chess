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

    it "moves the black queen Knight to c6" do
      move = 'Nc6'
      game.player_move(move)
      game.board.display

      expect(game.board.piece_at([2, 2])).to be_an_instance_of(Knight)
    end
  end
end
