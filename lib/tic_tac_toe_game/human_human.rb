
class HumanHuman
    def initialize(input,output)
        @output = output
        @input = input
    end
    def ask_for_first_player
        @output.display_player1
        @output.display_player2
        while true
            @output.display_choice
            ans = @input.gets.chomp
            return "player1" if ans == "1"
            return "player2" if ans == "2"
        end 
    end

    def next_player(player)
        player == "player1" ? "player2" : "player1"               
    end

    def ask_for_player_move(game, player)
        ask_for_move(game)
    end

    def ask_for_move position
        while true
            @output.display_move
            ans = @input.gets.chomp
            return ans.to_i if ans =~ /^\d+$/ && position.board[ans.to_i] == "-"
        end

    end

    def name
        "human"
    end

end