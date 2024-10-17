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

  end

end
