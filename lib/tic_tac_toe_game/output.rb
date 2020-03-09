class Output

    attr_reader :text, :win_text

    def initialize
        @text = "draw"
        @win_text = "winner: "
    end

    def display_tie
        puts @text
    end
    def display_win(other_player)
        puts @win_text + other_player
    end
end
