require_relative 'output'

module TicTacToeGame
    class ContinueGame
        def initialize(output,input)
            @output = output
            @input = input
        end
        def play_again?
            @output.display_play_again
            user_answer = @input.gets.chomp
            if user_answer == "1"
                return true
            end
            return false
        end
        
    end
    
end