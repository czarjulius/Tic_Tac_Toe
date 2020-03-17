require "json"
require "./lib/tic_tac_toe_game/language_option"

class Output 
    def initialize(new_language_option = LanguageOption.new(JSON.parse(File.read("./lib/tic_tac_toe_game/language_settings.json"))))
      @new_language_option = new_language_option  
    end
    def initialize_language_option
        @language = @new_language_option.chose_language
    end
    def display_tie
        puts @language["draw_text"]
    end
    def display_win(other_player)
        puts @language["win_text"] + other_player
    end
    def display_rules
        puts @language["rules_text"]
    end

    def display_ask_for_player
        puts @language["ask_for_player_text"]
    end
    def display_player1
        puts @language["player1_text"]
    end
    def display_player2
        puts @language["player2_text"]
    end
    def display_choice
        print @language["choice_text"]
    end
    def display_move
        print @language["move_text"]
    end
    def display_play_again
        puts @language["play_again_text"]
    end

    def display_game(game)
        puts game
    end

end
