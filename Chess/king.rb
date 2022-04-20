require_relative "piece"
require_relative "module_stepable"

class King < Piece
    include Stepable
    def initialize(color, board, pos)
        super
    end

    def symbol
        if self.color == :black
            " ♚ ".colorize(:blue)
        else
            " ♚ ".colorize(:magenta)
        end
    end

    def move_diffs
        moves = [[0,1], [0,-1], [1,0], [-1,0], [1,1], [1,-1], [-1, 1], [-1, -1]]
    end
end 