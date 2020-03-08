module TicTacToeGame

    class TTT
        def ask_for_player
            print <<-EOS 
            \n
            ========================================= GAME INSTRUCTIONS ==========================================
            || 1. The game is played on a grid that's 3 squares by 3 squares.                                     ||
            || 2. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.||
            || 3. You can chose to move from 0 to 8                                                               ||
            || 4. When all 9 squares are full, the game is over. If no player has 3 marks in a row,               ||
            ||    the game ends in a tie.                                                                         ||
            ======================================================================================================
            \n
            EOS
            puts "Who do you want to play first"
            puts "1. player1"
            puts "2. player2"
            while true
                print "choice: "
                ans = gets.chomp
                return "player1" if ans == "1"
                return "player2" if ans == "2"
            end
        end

        def ask_for_move position
            while true
                print "move: "
                ans = gets.chomp
                return ans.to_i if ans =~ /^\d+$/ && position.board[ans.to_i] == "-"
            end

        end

        def other_player
            @player == "player1" ? "player2" : "player1"
        end

        def play_game
            @player = ask_for_player
            game = Game.new
            while !game.end?
                puts game
                puts
                idx = ask_for_move(game)
                game.move(idx)
            end
            puts game
            if game.blocked?
                puts "draw"
            else
                puts "winner: #{other_player}"
            end

        end
    end
end
