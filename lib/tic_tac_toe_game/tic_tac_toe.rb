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
        @board = board || Array.new(@size, "-")
        @turn = turn
        @movelist = []
      end

      def other_turn
        @turn == "x" ? "o" : "x"
      end

      def move idx
        @board[idx] = @turn
        @turn = other_turn
        @movelist << idx
        self
      end

      def unmove
        @board[@movelist.pop] = "-"
        @turn = other_turn
        self
      end

    end














end