#
#
#
class Piece
  attr_reader :color, :position
  
  def initialize(color, position)
    @color = color # :white or :black
    @position = position # array [0, 0] is 'a1'
  end

  # this should be overridden by subclass
  def valid_moves
    raise NotImplementedError, "This method should be overridden by subclasses."
  end

  def to_s
    symbol
  end
end
