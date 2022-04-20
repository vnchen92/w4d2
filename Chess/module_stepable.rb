module Stepable
    def moves
        poss_moves = []
        move_diffs.each do |direction|
            x, y = self.pos
            poss_x = direction.first + x
            poss_y = direction.last + y
            if ((0..7).include?(poss_x) && (0..7).include?(poss_y)) 
                if @board[[poss_x,poss_y]].empty?
                    poss_moves << [poss_x, poss_y]
                elsif @board[[poss_x,poss_y]].color != self.color
                    poss_moves << [poss_x, poss_y]
                end
            end
        end
        poss_moves
    end

    private
    
    def move_diffs
        raise "move_diffs"
    end
end