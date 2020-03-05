require_relative 'play'
# require_relative 'move'

module TicTacToeGame
    class Position
        attr_accessor :board, :turn
        def initialize board = nil, turn = "x"
            @dim = 3
            @size = @dim * @dim
            @board = board || Array.new(@size, "-")
            @turn = turn
            @movelist = []
            @play = Play.new(@board)
            # @move = Play.new(@board, @turn, @movelist)
        end

        def other_turn
            @turn == "x" ? "o" : "x"
        end

        def move idx
            @board[idx] = @turn
            @turn = other_turn
            @movelist << idx
            self
        end

        def unmove
        @board[@movelist.pop] = "-"
        @turn = other_turn
        self
        end

         def win_lines
        (
            (0..@size.pred).each_slice(@dim).to_a + (0..@size.pred).each_slice(@dim).to_a.transpose + [ (0..@size.pred).step(@dim.succ).to_a ] + [ (@dim.pred..(@size-@dim)).step(@dim.pred).to_a ]
        ).map {|line| line.map {|idx| @board[idx] }}
        end

        def win? piece
        win_lines.any? { |line|
            line.all? { |line_piece| line_piece == piece }
        }
        end

        def blocked?
        win_lines.all? { |line| 
            line.any? {|line_piece| line_piece == "x" } &&
            line.any? {|line_piece| line_piece == "o" }
        }
        end

        def evaluate_leaf
        return 100 if win?("x")
        return -100 if win?("o")
        return 0 if blocked?
        end

        def minimax idx = nil
        move(idx) if idx
        leaf_value = evaluate_leaf
        return leaf_value if leaf_value
        @play.possible_moves.map { |idx|
            minimax(idx).send(@turn == "x" ? :- : :+, @movelist.count+1)
        }.send(@turn == "x" ? :max : :min)
        ensure
        unmove if idx
        end

    end
end