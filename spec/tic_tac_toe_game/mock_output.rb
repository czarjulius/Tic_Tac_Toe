class MockOutput
    attr_reader :tie, :win
    def initialize
        @tie = false
        @win = false
        @rules_text=""
        @ask_for_player_text = ""
        @player1_text=""
        @player2_text=""
        @choice_text=""
        @move_text=""
    end

    def display_tie
        @tie = true
    end
    def display_win(piece)
        @win = true
    end
    def display_rules
        @rules_text = true
    end
    def display_ask_for_player
        @ask_for_player_text
    end
    def display_player1
        @player1_text
    end
    def display_player2
        @player2_text
    end
    def display_choice
        @choice_text
    end
    def display_move
        @move_text
    end
    def display_game(game)
        true
    end

end