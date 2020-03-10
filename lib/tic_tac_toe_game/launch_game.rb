require_relative 'output.rb'

module TicTacToeGame

    class LaunchGame
        def initialize(input=STDIN, output=Output.new,  game = Game.new)
            @input = input
            @output = output
            @game = game
            @player = "player1"
        end
        def ask_for_player
            @output.display_rules
            @output.display_ask_for_player
            @output.display_player1
            @output.display_player2
            while true
                @output.display_choice
                ans = @input.gets.chomp
                return "player1" if ans == "1"
                return "player2" if ans == "2"
            end
        end

        def ask_for_move position
            while true
                @output.display_move
                ans = @input.gets.chomp
                return ans.to_i if ans =~ /^\d+$/ && position.board[ans.to_i] == "-"
            end

        end

        def other_player
            @player = @player == "player1" ? "player2" : "player1"
        end

        def play_game
            @player = ask_for_player
            while !@game.end?
                @output.display_game(@game)
                idx = ask_for_move(@game)
                @game.move(idx)
            end
            @output.display_game(@game)
            if @game.blocked?
                @output.display_tie
            else
                @output.display_win(other_player)

            end

        end
    end
end
