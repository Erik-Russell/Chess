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

    it "moves the white queen's knight to c3" do
      position = [7, 1] # white queen's knight
      destination = [5, 2] # move up and to the right

      game.player_move(position, destination)

      expect(game.board.piece_at(destination)).to be_an_instance_of(Knight)
    end

    it "does not move to an invalid destination" do
      position = [7, 1] # white queen's knight
      destination = [6, 3] # occupied by a white pawn

      game.player_move(position, destination)

      expect(game.board.piece_at(destination)).to be_an_instance_of(Pawn)
      expect(game.board.piece_at(position)).to be_an_instance_of(Knight)
    end
  end

end
