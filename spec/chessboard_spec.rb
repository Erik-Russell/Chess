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

  describe 'place_pieces' do
    subject(:board) { ChessBoard.new }
    it 'places a white rook at a1' do
      white_rook1 = board.piece_at([7,0])
      expect(white_rook1).to be_an_instance_of(Rook)
      expect(white_rook1.color).to eq(:white)
    end

    it 'places a black rook at a8' do
      black_rook1 = board.piece_at([0,0])
      expect(black_rook1).to be_an_instance_of(Rook)
      expect(black_rook1.color).to eq(:black)
    end

  end
end
