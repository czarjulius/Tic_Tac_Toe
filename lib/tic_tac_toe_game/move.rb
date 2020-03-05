module TicTacToeGame
    class Move      
        def initialize(board, turn, movelist)
            @board = board
            @turn = turn
            @movelist = movelist
        end

        def move idx
            @board[idx] = @turn
            @turn = other_turn
            @movelist << idx
            self
        end
    end
end