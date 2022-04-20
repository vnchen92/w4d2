module Slideable
    HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1, 1], [-1, -1]]

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def moves
        poss_moves = []
        self.move_dirs.each do |direction|
            dx = direction.first
            dy = direction.last
            poss_moves += grow_unblocked_moves(dx, dy)
        end
        poss_moves
    end

    def grow_unblocked_moves(dx, dy)
        unblocked_moves = []
        x, y = self.pos
        poss_x = x + dx
        poss_y = y + dy
        while ((0..7).include?(poss_x) && (0..7).include?(poss_y))
            if @board[[poss_x,poss_y]].empty?
                unblocked_moves << [poss_x, poss_y]
            elsif @board[[poss_x,poss_y]].color != self.color
                unblocked_moves << [poss_x, poss_y]
            else
                break
            end
            poss_x += dx
            poss_y += dy
        end
        unblocked_moves
    end

    def move_dirs
        raise "slidable move dirs"
    end

     
end