class FakeGame
    attr_reader :board
    attr_reader :empty_board
    attr_accessor :is_blocked
    attr_accessor :is_won
    attr_accessor :end

    def initialize(board=Array.new(9, '-'), block=true)
        @board = board
        @is_blocked = block
        @is_won = true
        @end = true
        @empty_board = false
    end
    def end?
        @end
    end

    def win? piece
        @is_won
    end

    def blocked?
        @is_blocked
    end
    def clear_board
        @empty_board = true
    end
    def best_move
        
    end
end