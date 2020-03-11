class Output
    def display_tie
        puts STR_HASH[:text]
    end
    def display_win(other_player)
        puts STR_HASH[:win_text] + other_player
    end
    def display_rules
        puts STR_HASH[:rules_text]
    end

    def display_ask_for_player
        puts STR_HASH[:ask_for_player_text]
    end
    def display_player1
        puts STR_HASH[:player1_text]
    end
    def display_player2
        puts STR_HASH[:player2_text]
    end
    def display_choice
        print STR_HASH[:choice_text]
    end
    def display_move
        print STR_HASH[:move_text]
    end

    def display_game(game)
        puts game
    end
end
