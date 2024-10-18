require_relative '../lib/chessboard'

describe ChessBoard do
  describe '#initialize' do
    subject(:board) { ChessBoard.new }
    it 'creates a new instance' do
      expect(board).to be_an_instance_of(ChessBoard)
    end
  end

  describe '#display' do
    subject(:board) { ChessBoard.new }
    it 'puts the board on the screen' do
      expect(board.display).to be nil
    end
  end

end
