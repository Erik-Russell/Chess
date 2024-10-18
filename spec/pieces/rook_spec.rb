require_relative '../../lib/pieces/rook.rb'

describe Rook do
  subject(:white_rook) { Rook.new(:white,[0,0]) }
  it 'returns an array of moves' do
    expect(white_rook.valid_moves).to be_an(Array)
  end

  it 'returns correct array from a1' do
    expect(white_rook.valid_moves).to contain_exactly(
      [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],  # Vertical moves
      [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]   # Horizontal moves
      )
  end
end
