class MockOutput
    attr_reader :tie, :win
    def initialize
        @tie = false
        @win = false
    end

    def display_tie
        @tie = true
    end
    def display_win
        @win = true
    end

end