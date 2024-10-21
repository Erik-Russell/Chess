module Notation
  BOARD_COLUMNS = ('a'..'h').to_a

  def self.position_from_notation(notation)
    column, row = notation[-2], notation[-1].to_i
    x = 8 - row                      # Ranks (8-1) map to y (0-7)
    y = BOARD_COLUMNS.index(column)  # Files (a-h) map to x (0-7)
    [x, y]
  end

  def self.notation_from_position(x, y)
    column = BOARD_COLUMNS[y]         # x represents the rank, so it maps to a file
    row = (8 - x).to_s                # Inverse mapping for rank
    "#{column}#{row}"
  end

  def self.parse_move(notation, color)
    # Check for special moves
    if notation.include?("O-O") || notation.include?("O-O-O")
      return parse_castle(notation, color)
    end

    if notation.include?("e.p.")
      return parse_en_passant(notation, color)
    end

    if notation.length == 2
      # It's a pawn move (e.g., e4)
      piece = 'Pawn'
      target_position = position_from_notation(notation)
    else
      # Capture move check
      if notation.include?("x")
        piece = piece_from_notation(notation[0]) 
        target_position = position_from_notation(notation[2..3])
      else
        piece = piece_from_notation(notation[0])
        target_position = position_from_notation(notation[1..2])
      end
    end

    # Check for check or checkmate
    check = notation.include?("+")
    checkmate = notation.include?("#")

    { piece: piece, target_position: target_position, check: check, checkmate: checkmate }
  end

  def self.parse_castle(notation, color)
    piece = 'King'
    if color == :white
      target_position = notation == "O-O" ? [7, 6] : [7, 2]  # White positions
    else
      target_position = notation == "O-O" ? [0, 6] : [0, 2]  # Black positions
    end
    { piece: piece, target_position: target_position, castle: true }
  end

  def self.parse_en_passant(notation, color)
    column = notation[0]
    target_row = notation[-1].to_i
    target_position = position_from_notation("#{column}#{target_row}")

    piece = 'Pawn'
    { piece: piece, target_position: target_position, en_passant: true }
  end

  def self.piece_from_notation(letter)
    case letter
    when 'N' then 'Knight'
    when 'B' then 'Bishop'
    when 'R' then 'Rook'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    else 'Pawn'  # Default to Pawn if no piece is specified
    end
  end
end

