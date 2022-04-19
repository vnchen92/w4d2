require_relative "piece.rb"

class Board
    def initialize
        @rows = Array.new(8){Array.new(8)}
        place_pieces
    end

    def place_pieces
        (0..7).each do |i|
            (0..7).each do |j|
                if (2..5).include?(i)
                    @rows[i][j] = nil
                else
                    @rows[i][j] = Piece.new
                end
            end
        end
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
        raise "No piece" if self[start_pos] == nil
        raise "Space taken" if self[end_pos] != nil
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

    
end