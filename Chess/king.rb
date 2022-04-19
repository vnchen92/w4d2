require_relative "piece"

class King < Piece
    include Stepable
    def initialize
        super
    end
end 