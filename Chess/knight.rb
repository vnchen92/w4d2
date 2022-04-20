require_relative "piece"
require_relative "module_stepable"

class Knight < Piece
    include Stepable
    def initialize(color, board, pos)
        super
    end

    def symbol
        if self.color == :black
            " ♞ ".colorize(:blue)
        else
            " ♞ ".colorize(:magenta)
        end
    end

    def move_diffs
        moves = [[2,1], [1,2], [-2, 1], [1, -2], [2, -1,], [-1, 2], [-2, -1], [-1, -2]]
    end
end 