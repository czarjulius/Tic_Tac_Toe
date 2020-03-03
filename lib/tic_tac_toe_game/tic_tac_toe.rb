module TicTacToeGame
    class TicTacToe
      def self.welcome
          'Welcome to Tic Tac Toe Game'
      end
    end

    class Position
      attr_accessor :board, :turn
      def initialize board = nil, turn = "x"
        @dim = 3
        @size = @dim * @dim
        @board = Array.new(@size, "-")
        @turn = "x"
      end
    end














end