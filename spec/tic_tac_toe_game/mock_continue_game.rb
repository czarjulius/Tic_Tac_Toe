require_relative 'mock_output.rb'

class FakeContinueGame
    def initialize(num_of_rounds = 0)
        @num_of_rounds = num_of_rounds
    end

    
    def play_again?
        @num_of_rounds -= 1

        @num_of_rounds >= 0  
    end
    
end
    
