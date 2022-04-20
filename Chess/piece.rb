class Piece
    attr_reader :color, :pos
    attr_writer :pos
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?
        self.instance_of?(NullPiece)
    end

    # def valid_moves
    #     move_dirs
    # end

    # def pos=(val)

    # end

    

end