require_relative 'play'
require_relative 'toggle'
require_relative 'move'

module TicTacToeGame
    class Position
        attr_accessor :board
        def initialize(board = nil, turn = "x")
            @dim = 3
            @size = @dim * @dim
            @board = board || Array.new(@size, "-")
            
            @movelist = []
            @play = Play.new(@board)
            @toggle = Toggle.new(turn)
            @move = Move.new(@board, @turn, @movelist)
        end

        def turn
            @toggle.current_turn
        end

        def other_turn
            @toggle.other_turn
        end

        def move idx
            @board[idx] = @toggle.current_turn
            @toggle.other_turn
            @movelist << idx
            puts @movelist
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

        def end?
            win?("x") || win?("o") || @board.count("-") == 0
        end

        def to_s
            @board.each_slice(@dim).map { |line|
              " " + line.map {|piece| piece == "-" ? " " : piece}.join(" | ") +" "
            }.join("\n-----------\n") + "\n"
        end
    end

    class TTT
        def ask_for_player
            print <<-EOS 
            \n
             ========================================= GAME INSTRUCTIONS ==========================================
            || 1. The game is played on a grid that's 3 squares by 3 squares.                                     ||
            || 2. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.||
            || 3. You can chose to move from 0 to 8                                                               ||
            || 4. When all 9 squares are full, the game is over. If no player has 3 marks in a row,               ||
            ||    the game ends in a tie.                                                                         ||
             ======================================================================================================
             \n
            EOS
            puts "Who do you want to play first"
            puts "1. player1"
            puts "2. player2"
            while true
                print "choice: "
                ans = gets.chomp
                return "player1" if ans == "1"
                return "player2" if ans == "2"
            end
        end

        def ask_for_move position
            while true
                print "move: "
                ans = gets.chomp
                return ans.to_i if ans =~ /^\d+$/ && position.board[ans.to_i] == "-"
            end

        end

        def other_player
            @player == "player1" ? "player2" : "player1"
        end

        def play_game
            @player = ask_for_player
            position = Position.new
            while !position.end?
                puts position
                puts
                idx = ask_for_move(position)
                position.move(idx)
            end
            puts position
            if position.blocked?
                puts "draw"
            else
                puts "winner: #{other_player}"
            end

        end
    end
end

if __FILE__ == $0
    TicTacToeGame::TTT.new.play_game
end