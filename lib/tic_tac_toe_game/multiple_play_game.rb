
module TicTacToeGame
    class MultiplePlayGame
        attr_reader :lunch_game
        def initialize(input,output,game, lunch_game,continue_game)
            @input = input
            @output = output
            @game = game
            @continue_game = continue_game
            @lunch_game = lunch_game
            @play_again_choice = true
        end

        def multiple_play_game
            while @play_again_choice
                @lunch_game.play_game
                @play_again_choice=@continue_game.play_again?
            end
        end
    end
end