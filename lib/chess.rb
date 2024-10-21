#
#
require_relative './chessboard.rb'
require_relative './modules/notation.rb'
#
class Chess
  include Notation

  attr_reader :board

  def initialize
    @board = ChessBoard.new
  end

  def player_move(move_notation)
    # Parse the move notation (e.g., 'Nf3' or 'e4')
    parsed_move = Notation.parse_move(move_notation)

    # Find the piece to move and the target position
    piece = parsed_move[:piece] # 'Knight', 'Pawn', etc.
    destination = parsed_move[:target_position] # [x, y] coordinates

    puts "Parced Piece:#{piece}, destination:#{destination}"

    # Find the actual piece to move based on the type and board
    # You may need to enhance this to check for the player's color, etc.
    valid_piece = find_piece_for_move(piece, destination)

    if valid_piece
      player_position = valid_piece.position # Get the current position
      valid_moves = valid_piece.valid_moves(@board)

      # Move the piece if the move is valid
      if valid_moves.include?(destination)
        @board.move_piece(player_position, destination)
      else
        puts "Invalid move. Please try again"
      end
    else
      puts "No valid piece found for this move."
    end
  end

  private

  def find_piece_for_move(piece_name, destination)
    # Loop through board to find valid piece of given type
    @board.board.flatten.each do |piece|
      next if piece.nil?
      return piece if piece.class.to_s == piece_name && piece.valid_moves(@board).include?(destination)
    end
    nil
  end
end
