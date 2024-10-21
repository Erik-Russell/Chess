#
#
require_relative '../../lib/modules/notation.rb'

describe Notation do

  describe '.position_from_notation' do

    it 'converts a1 to [7, 0]' do
      expect(Notation.position_from_notation('a1')).to eq([7, 0])
    end

    it 'converts h1 to [7, 7]' do
      expect(Notation.position_from_notation('h1')).to eq([7, 7])
    end

    it 'converts a8 to [0, 0]' do
      expect(Notation.position_from_notation('a8')).to eq([0, 0])
    end

    it 'converts h8 to [0, 7]' do
      expect(Notation.position_from_notation('h8')).to eq([0, 7])
    end

  end

  describe '.notation_from_position' do
    it 'converts [7, 0] to a1' do
      expect(Notation.notation_from_position(7, 0)).to eq('a1')
    end

    it 'converts [7, 7] to h1' do
      expect(Notation.notation_from_position(7, 7)).to eq('h1')
    end

    it 'converts [0, 0] to a8' do
      expect(Notation.notation_from_position(0, 0)).to eq('a8')
    end

    it 'converts [0, 7] to h8' do
      expect(Notation.notation_from_position(0, 7)).to eq('h8')
    end
  end

  describe '.parse_move' do
    it 'identifies a pawn move from e4' do
      expect(Notation.parse_move('e4', :white)).to eq({ piece: 'Pawn', target_position: [4, 4], check: false, checkmate: false })
    end

    it 'identifies a knight move from Nf3' do
      expect(Notation.parse_move('Nf3', :white)).to eq({ piece: 'Knight', target_position: [5, 5], check: false, checkmate: false })
    end

    it 'identifies a white castling move kingside' do
      expect(Notation.parse_move('O-O', :white)).to eq({ piece: 'King', target_position: [7, 6], castle: true })
    end

    it 'identifies a black castling move kingside' do
      expect(Notation.parse_move('O-O', :black)).to eq({ piece: 'King', target_position: [0, 6], castle: true })
    end
  end
end
