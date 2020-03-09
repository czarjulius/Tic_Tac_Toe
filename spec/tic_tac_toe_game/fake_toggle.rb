class FakeToggle
    attr_reader :toggles
    def initialize
        @toggles = 0
    end

    def current_turn
        'x'
    end
    
    def other_turn
        @toggles += 1
    end
end