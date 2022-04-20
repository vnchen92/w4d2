require_relative "piece"

class Pawn < Piece
    
    def initialize(color, board, pos)
        super
    end

    def symbol
        if self.color == :black
            " ♟ ".colorize(:blue)
        else
            " ♟ ".colorize(:magenta)
        end
    end

    def moves
        forward_steps + side_attacks
    end

    def at_start_row?
        if self.pos.first == 1 && self.color == :black
            true
        elsif self.pos.first == 6 && self.color == :white
            true
        else
            false
        end
    end

    def forward_dir
        if self.color == :black
            return 1
        else
            return -1
        end
    end

    def forward_steps
        steps = []
        x, y = self.pos
        dx = forward_dir   
        poss_x = x + dx
        
        if (0..7).include?(poss_x)
            if @board[[poss_x,y]].empty?
                steps << [poss_x, y]

                if at_start_row? && @board[[poss_x + dx, y]].empty?
                    steps << [poss_x + dx, y]
                end
            end
        end
        steps
    end

    def side_attacks
        steps = []
        x, y = self.pos

        up_left = [x + forward_dir, y - 1]
        up_right = [x + forward_dir, y + 1]

        steps << up_left if attackable(up_left)
        steps << up_right if attackable(up_right)

        steps
    end

    def attackable(pos)
        if (0..7).include?(pos.first) && (0..7).include?(pos.last)
            return (!@board[pos].empty?) && (@board[pos].color != self.color)
        end
    end

end 