require_relative "piece"

class Bishop < Piece
    include Slidable

    def initialize
        super
    end
end 