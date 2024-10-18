
require_relative '../../lib/pieces/piece.rb'

describe Piece do
  describe '#initialize' do
    subject(:piece) { Piece.new(:white,[0,0]) }
    it 'is white and at (a1)' do
      expect(piece.color).to eq(:white)
      expect(piece.position).to eq([0,0])
    end
  end

  describe '#valid_moves' do
    subject(:piece) { Piece.new(:white,[0,0]) }
    it 'raises and error' do
      expect { piece.valid_moves }.to raise_error(NotImplementedError, "This method should be overridden by subclasses.")
    end
  end
end
