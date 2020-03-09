class FakeGame
    attr_reader :board
    attr_accessor :is_blocked
    attr_accessor :is_winned

    def initialize(board=Array.new(9, '-'), block=true)
        @board = board
        @is_blocked = block
        @is_winned = true
    end
    def end?
        true
    end

    def win? piece
        @is_winned
    end

    def blocked?
        @is_blocked
    end
end