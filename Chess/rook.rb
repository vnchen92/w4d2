require_relative "piece"
require_relative "module_slideable"

class Rook < Piece
    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        if self.color == :black
            " ♜ ".colorize(:blue)
        else
            " ♜ ".colorize(:magenta)
        end
    end

    def move_dirs
        HORIZONTAL_DIRS
    end
end 