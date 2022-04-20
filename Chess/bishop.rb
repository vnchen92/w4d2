require_relative "piece"
require_relative "module_slideable"

class Bishop < Piece
    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        if self.color == :black
            " ♝ ".colorize(:blue)
        else
            " ♝ ".colorize(:magenta)
        end
    end

    def move_dirs
        DIAGONAL_DIRS
    end
end 