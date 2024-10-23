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
      game.player_move(move, :black)
      game.board.display

      expect(game.board.piece_at([2, 2])).to be_an_instance_of(Knight)
    end

    it "moves a white pawn to d4" do
      move = 'd4'
      game.player_move(move, :white)
      game.board.display

      expect(game.board.piece_at([4, 3])).to be_an_instance_of(Pawn)
    end

    context "simple opening" do
      it 'setup basic pawn triangle' do
        game.player_move('d4', :white)
        game.player_move('d5', :black)
        game.player_move('e4', :white)
        game.player_move('e5', :black)
        game.player_move('c6', :white)
        game.player_move('c3', :black)
        game.player_move('f6', :white)
        game.player_move('f3', :black)
        game.board.display

        expect(game.board.piece_at([0,0])).to be_an_instance_of(Rook)
      end
    end
  end

  describe 'Castling' do
    let(:game) { Chess.new }

    context 'when castling kindside' do
      it 'allows kingside castling if conditions are met' do
        # move pieces out of way
        game.board.move_piece([7, 5], [5, 5])
        game.board.move_piece([7, 6], [5, 6])

        game.board.display

        expect(game.board.piece_at([7, 4]).can_castle?(game.board, [7, 7])).to be true

        game.player_move("O-O", :white)

        game.board.display

        expect(game.board.piece_at([7, 6])).to be_an_instance_of(King)
        expect(game.board.piece_at([7, 5])).to be_an_instance_of(Rook)
      end
    end

    context 'when castling queenside' do
      it 'allows queenside castling if conditions are met' do
        # Ensure there are no pieces between the king and rook
        game.board.move_piece([7, 3], [5, 3]) # Clear space for testing
        game.board.move_piece([7, 2], [5, 2])
        game.board.move_piece([7, 1], [5, 1])

        game.board.display

        expect(game.board.piece_at([7, 4]).can_castle?(game.board, [7, 0])).to be true

        # Perform the castling move
        game.player_move("O-O-O", :white)

        game.board.display

        # Check positions after castling
        expect(game.board.piece_at([7, 2])).to be_a(King)
        expect(game.board.piece_at([7, 3])).to be_a(Rook)
      end
    end

    context 'when castling conditions are not met' do
      it 'does not allow castling if the king or rook has moved' do
        game.board.move_piece([7, 3], [5, 3]) # Clear space for testing
        game.board.move_piece([7, 2], [5, 2])
        game.board.move_piece([7, 1], [5, 1])

        king = game.board.piece_at([7, 4])
        king.move_to([7, 3])
        king.move_to([7, 4])

        expect(king.can_castle?(game.board, [7, 0])).to be false
      end

      it 'does not allow castling if a square is under attack' do
        game.board.move_piece([7, 3], [5, 3]) # Clear space for testing
        game.board.move_piece([7, 2], [5, 2])
        game.board.move_piece([7, 1], [5, 1])
        game.board.move_piece([0, 0], [6, 2])

        puts game.board.display

        expect(game.board.piece_at([7, 4]).can_castle?(game.board, [7, 0])).to be false
      end
    end
  end
end
