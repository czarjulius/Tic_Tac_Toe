require_relative './tic_tac_toe_game/launch_game'
require_relative './tic_tac_toe_game/output'
require_relative './tic_tac_toe_game/continue_game'
require_relative './tic_tac_toe_game/game'

module TicTacToeGame
    class MultiplePlayGame
        attr_reader :lunch_game
        def initialize(
            input=STDIN,
            output=Output.new,
            game = TicTacToeGame::Game.new, 
            lunch_game=TicTacToeGame::LaunchGame.new(input,output,game),
            continue_game = TicTacToeGame::ContinueGame.new(output, input)
        )
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