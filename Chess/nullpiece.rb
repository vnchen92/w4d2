require "singleton"
require_relative "piece"

class NullPiece < Piece
    include Singleton

    def initialize
        @color = :none
    end

    def symbol
        "   "
    end

    

end