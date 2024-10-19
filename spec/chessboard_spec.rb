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
      white_rook1 = board.piece_at([7, 0])
      expect(white_rook1).to be_an_instance_of(Rook)
      expect(white_rook1.color).to eq(:white)
    end

    it 'places a black rook at a8' do
      black_rook1 = board.piece_at([0, 0])
      expect(black_rook1).to be_an_instance_of(Rook)
      expect(black_rook1.color).to eq(:black)
    end

    it 'places a white bishop at c1' do
      white_bishop1 = board.piece_at([7, 2])
      expect(white_bishop1).to be_an_instance_of(Bishop)
      expect(white_bishop1.color).to eq(:white)
    end
 
    it 'places a black bishop at c8' do
      black_bishop = board.piece_at([0, 2])
      expect(black_bishop).to be_an_instance_of(Bishop)
      expect(black_bishop.color).to eq(:black)
    end

    it 'places a white knight at b1' do
      white_knight= board.piece_at([7, 1])
      expect(white_knight).to be_an_instance_of(Knight)
      expect(white_knight.color).to eq(:white)
    end
 
    it 'places a black knight at b8' do
      black_knight= board.piece_at([0, 1])
      expect(black_knight).to be_an_instance_of(Knight)
      expect(black_knight.color).to eq(:black)
    end

    it 'places a white queen at d1' do
      white_queen = board.piece_at([7, 3])
      expect(white_queen).to be_an_instance_of(Queen)
      expect(white_queen.color).to eq(:white)
    end

    it 'places a black queen at d8' do
      black_queen = board.piece_at([0, 3])
      expect(black_queen).to be_an_instance_of(Queen)
      expect(black_queen.color).to eq(:black)
    end

    it 'places a white king at e1' do
      white_king = board.piece_at([7, 4])
      expect(white_king).to be_an_instance_of(King)
      expect(white_king.color).to eq(:white)
    end

    it 'places a black king at e8' do
      black_king = board.piece_at([0, 4])
      expect(black_king).to be_an_instance_of(King)
      expect(black_king.color).to eq(:black)
    end

    it 'places a white pawn at a2' do
      white_pawn = board.piece_at([6, 0])
      expect(white_pawn).to be_an_instance_of(Pawn)
      expect(white_pawn.color).to eq(:white)
    end
  end
end

