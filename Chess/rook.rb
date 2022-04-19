require_relative "piece"

class Rook < Piece
    include Slidable

    def initialize
        super
    end
end 