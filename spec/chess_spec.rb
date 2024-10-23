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
end
