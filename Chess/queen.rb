require_relative "piece"

class Queen < Piece
    include Slidable

    def initialize
        super
    end
end 