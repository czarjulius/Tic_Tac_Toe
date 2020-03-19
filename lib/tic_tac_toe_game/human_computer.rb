class HumanComputer
    def initialize(input, output)
        @input = input
        @output = output
    end

    def ask_for_first_player
        @output.display_human
        @output.display_computer
        while true
            @output.display_choice
            ans = @input.gets.chomp
            return "human" if ans == "1"
            return "computer" if ans == "2"
        end
    end

    def next_player(player)
        player == "human" ? "computer" : "human"                               
    end

    def ask_for_player_move(game, player)
        player == "human" ? ask_for_move(game) : game.best_move
    end
    def ask_for_move position
        while true
            @output.display_move
            ans = @input.gets.chomp
            return ans.to_i if ans =~ /^\d+$/ && position.board[ans.to_i] == "-"
        end

    end

    def name
        "computer"
    end

end