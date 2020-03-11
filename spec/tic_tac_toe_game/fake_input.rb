class FakeInput
    def initialize(array = [])
        @array = array
        @index = -1
    end
    
    def gets
        @index += 1
        @array[@index]
    end
end