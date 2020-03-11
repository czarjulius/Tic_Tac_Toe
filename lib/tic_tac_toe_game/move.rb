module TicTacToeGame
    class Move
        attr_reader :board, :turn
        def initialize(board, turn = nil)
            @board = board
            
            # @movelist = movelist
        end

        def move (idx, toggle)
            @board[idx] = toggle.current_turn
            toggle.other_turn
            # @movelist << idx
            self
        end
    end
end