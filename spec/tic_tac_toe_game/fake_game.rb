class FakeGame
    attr_reader :board
    attr_accessor :is_blocked
    attr_accessor :is_won

    def initialize(board=Array.new(9, '-'), block=true)
        @board = board
        @is_blocked = block
        @is_won = true
    end
    def end?
        true
    end

    def win? piece
        @is_won
    end

    def blocked?
        @is_blocked
    end
    def clear_board
        
    end
end