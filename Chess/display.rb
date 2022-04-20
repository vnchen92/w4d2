require "colorize"
require_relative "cursor.rb"

class Display
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        @board.rows.each do |row|
            puts row.map{|piece| piece.symbol.to_s}.join(" ")
        end
    end
end