#
#
require_relative './chessboard.rb'
require_relative './modules/notation.rb'
#
class Chess
  include Notation

  attr_reader :board, :current_turn

  def initialize
    @board = ChessBoard.new
    @current_turn = :white
  end

  def player_move(move_notation, color)
    # Parse the move notation (e.g., 'Nf3' or 'e4')
    parsed_move = Notation.parse_move(move_notation, color)

    # Handle castling moves
    if parsed_move[:move_type] == :castling
      if parsed_move[:side] == :kingside
        king_pos = color == :white ? [7, 4] : [0, 4]
        rook_pos = color == :white ? [7, 7] : [0, 7]
      else
        king_pos = color == :white ? [7, 4] : [0, 4]
        rook_pos = color == :white ? [7, 0] : [0, 0]
      end

      king = @board.piece_at(king_pos)
      if king.is_a?(King) && king.can_castle?(@board, rook_pos)
        # Perform the castling move
        perform_castling(king_pos, rook_pos)
        return
      else
        puts "Invalid castling move."
        return
      end
    end

    # Find the piece to move and the target position
    piece = parsed_move[:piece] # 'Knight', 'Pawn', etc.
    destination = parsed_move[:target_position] # [x, y] coordinates

    puts "Parced Piece:#{piece}, destination:#{destination}" # debugging

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

  def perform_castling(king_pos, rook_pos)
    row = king_pos[0]
    king_target = rook_pos[1] == 7 ? [row, 6] : [row, 2]
    rook_target = rook_pos[1] == 7 ? [row, 5] : [row, 3]

    @board.move_piece(king_pos, king_target)
    @board.move_piece(rook_pos, rook_target)
  end

  def play
    loop do
      @board.display
      puts "#{@current_turn.capitalize}:s turn. Enter your move (e.g., 'e4', 'Nf3', 'O-O'):"
      move_notation = gets.chomp

      begin
        player_move(move_notation, @current_turn)
        switch_turn
      rescue => e
        puts "Error: #{e.message}. Please try again."
      end
    end
  end

  def switch_turn
    @current_turn = @current_turn == :white ? :black : :white
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
