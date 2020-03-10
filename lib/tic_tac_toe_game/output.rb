class Output

    attr_reader :text, :win_text, :rules_text, :ask_for_player_text, :player1_text, :player2_text, :choice_text, :move_text

    def initialize
        @text = "draw"
        @win_text = "winner: "
        @rules_text = <<-EOS 
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
        @ask_for_player_text = "Who do you want to play first"
        @player1_text = "1. player1"
        @player2_text = "2. player2"
        @choice_text = "choice: "
        @move_text =  "move: "
    end

    def display_tie
        puts @text
    end
    def display_win(other_player)
        puts @win_text + other_player
    end
    def display_rules
        puts @rules_text
    end

    def display_ask_for_player
        puts @ask_for_player_text
    end
    def display_player1
        puts @player1_text
    end
    def display_player2
        puts @player2_text
    end
    def display_choice
        print @choice_text
    end
    def display_move
        print @move_text
    end

    def display_game(game)
        puts game
    end
end
