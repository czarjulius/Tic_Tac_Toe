require_relative 'play'
require_relative 'toggle'
require_relative 'move'
require_relative 'launch_game.rb'

module TicTacToeGame
    class Game
        attr_reader :board
        def initialize(board = nil, turn = "x")
            @dim = 3
            @size = @dim * @dim
            @board = board || Array.new(@size, "-")
            @play = Play.new(@board)
            @toggle = Toggle.new(turn)
            @move = Move.new(@board, @turn)
        end

        def move(idx)
            @move.move(idx,@toggle)
        end
        def clear_board
            @board = Array.new(@size, "-")
            @move = Move.new(@board, @turn)
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

        def end?
            win?("x") || win?("o") || @board.count("-") == 0
        end

        def to_s
            @board.each_slice(@dim).map { |line|
              " " + line.map {|piece| piece == "-" ? " " : piece}.join(" | ") +" "
            }.join("\n-----------\n") + "\n"
        end
    end
end

if __FILE__ == $0
    TicTacToeGame::LaunchGame.new.multiple_play_game
end