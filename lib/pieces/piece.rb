#
#
#
class Piece
  attr_reader :color
  attr_accessor :position, :previous_position
  
  def initialize(color, position)
    @color = color # :white or :black
    @position = position # array [0, 0] is 'a8'
    @previous_position = nil
  end

  # this should be overridden by subclass
  def valid_moves
    raise NotImplementedError, "This method should be overridden by subclasses."
  end

  def to_s
    symbol
  end

  def move_to(new_position)
    @previous_position = @position
    @position = new_position
  end
end
