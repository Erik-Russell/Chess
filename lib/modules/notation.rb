module Notation
  BOARD_COLUMNS = ('a'..'h').to_a

  def self.position_from_notation(notation)
    column, row = notation[0], notation[1].to_i
    x = 8 - row                      # Ranks (8-1) map to y (0-7)
    y = BOARD_COLUMNS.index(column)   # Files (a-h) map to x (0-7)
    [x, y]
  end

  def self.notation_from_position(x, y)
    column = BOARD_COLUMNS[y]   # x represents the rank, so it maps to a file
    row = (8 - x).to_s          # y represents the file, maps to rank
    "#{column}#{row}"
  end

  def self.parse_move(notation)
    if notation.length == 2
      # It's a pawn move (e.g., e4)
      piece = 'Pawn'
      target_position = position_from_notation(notation)
    else
      # It's a piece move (e.g., Nf3, Qd1)
      piece = piece_from_notation(notation[0])
      target_position = position_from_notation(notation[1..2])
    end

    { piece: piece, target_position: target_position }
  end

  def self.piece_from_notation(letter)
    case letter
    when 'N' then 'Knight'
    when 'B' then 'Bishop'
    when 'R' then 'Rook'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    else 'Unknown'
    end
  end
end

