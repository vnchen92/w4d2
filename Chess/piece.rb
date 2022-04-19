class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = []
    end

    def empty?
        self.instance_of(NullPiece)
    end

    def pos=(val)

    end

    def moves
        moves = []
    end

end