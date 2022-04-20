require_relative "pieces"
require "byebug"
require "colorize"

class Board 
    attr_reader :board 

    def initialize
        @nullpiece = NullPiece.instance
        @rows = Array.new(8){Array.new(8, @nullpiece)}
        place_pieces
    end

    def place_pieces
        pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        pieces.each_with_index do |piece, i|
            self[[0,i]] = piece.new(:black, self, [0,i])
            self[[7,i]] = piece.new(:white, self, [7,i])
        end

        (0..7).each do |i|
            self[[1, i]] = Pawn.new(:black, self, [1,i])
            self[[6, i]] = Pawn.new(:white, self, [6,i])
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "No piece here" if self[start_pos].empty? #for nullpiece
        
        if self[start_pos].moves.include?(end_pos)
            self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
            self[end_pos].pos = end_pos
            if self[start_pos].color != self[end_pos].color
                self[start_pos] = @nullpiece 
            end
        else
            raise "invalid move, my dude"
        end
    end

    def render
        (0..7).each do |i|
            (0..7).each do |j|
                if (i.even? && j.even?) || (i.odd? && j.odd?)
                    @rows[i][j].on_cyan
                else
                    @rows[i][j].on_gray
                end
            end
        end

        @rows.each_with_index do |row, i|
            puts row.map{|piece| piece.symbol}.join("")
        end
    end

    
end

# b = Board.new
# debugger
# b.move_piece([6,1],[4,1])