class FakeLunchGame
    attr_reader :game
    attr_accessor :continue_game
    attr_accessor :output
    attr_reader :count_game

    def initialize(input,output,game)
        @game = game
        @continue_game = continue_game
        @output = output
        @count_game = 0
    end
    def play_game
        @count_game += 1
    end

end