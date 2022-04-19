require_relative "piece"
require_relative "nullpiece"

class Board
    def initialize
        @rows = Array.new(8){Array.new(8)}
        @nullpiece = NullPiece.instance
        place_pieces
    end

    def place_pieces
        #place NullPieces
        (2..5).each do |i| 
            (0..7).each{|j| @rows[i][j] = @nullpiece }
        end
        # (0..7).each do |i|
        #     (0..7).each do |j|
        #         if (2..5).include?(i)
        #             @rows[i][j] = @nullpiece
        #         else
        #             @rows[i][j] = Piece.new(:B, @rows, [0.0])
        #         end
        #     end
        # end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "No piece here" if self[start_pos] == nil
        raise "Space taken" if self[end_pos] != nil
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

    
end