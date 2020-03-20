require_relative "human_human"
require_relative "human_computer"

module TicTacToeGame

    class LaunchGame
        def initialize(input=STDIN, output=Output.new, game=TicTacToeGame::Game.new, opponent="" )
            @input = input
            @output = output
            @game = game
            @player = "player1"

            if opponent =="human"
                @game_type = HumanHuman.new(@input,@output)
            elsif opponent == "computer"
                @game_type= HumanComputer.new(@input, @output)
            end
        end
        def ask_for_opponent
            @output.display_ask_for_opponent
            @output.display_human
            @output.display_computer
            while @game_type.nil?
                @output.display_choice
                ans = @input.gets.chomp
                if ans == "1"
                    @game_type = HumanHuman.new(@input,@output)
                    return @game_type.name
                end
                if ans == "2"
                    @game_type =  HumanComputer.new(@input, @output)
                    return @game_type.name
                end
            end
        end

        def get_game_type
            return @game_type

        end

        def ask_for_move(game)
            @game_type.ask_for_player_move(game, @player)
        end


        def ask_for_player
            @output.display_rules
            @output.display_ask_for_player

            get_game_type.ask_for_first_player

        end


        def other_player
            @player = get_game_type.next_player(@player)   
        end


        def play_game
            @output.initialize_language_option
            ask_for_opponent
            @player = ask_for_player
            while !@game.end?
                @output.display_game(@game)
                @output.display_puts
                idx = get_game_type.ask_for_player_move(@game, @player)
                @game.move(idx)
                other_player
            end
            @output.display_game(@game)
            if @game.blocked?
                @output.display_tie
            else
                @output.display_win(other_player)
            end
            @game.clear_board 
            @game_type = nil
        end

    end
end
