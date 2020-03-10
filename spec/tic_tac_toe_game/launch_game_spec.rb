require_relative '../../lib/tic_tac_toe_game/launch_game'
require_relative 'fake_input'
require_relative 'fake_game.rb'
require_relative 'mock_output'
require_relative '../../lib/tic_tac_toe_game/output.rb'

RSpec.describe TicTacToeGame::LaunchGame do
    context "#ask_for_player" do
        it "Should accept player as player1" do
            fakeinput = FakeInput.new(["0", "7", "1"])
            ttt = TicTacToeGame::LaunchGame.new(fakeinput)
            ttt.ask_for_player.should == "player1"
        end
        it "Should accept player as player2" do
            fakeinput = FakeInput.new(["0", "7", "2"])
            ttt = TicTacToeGame::LaunchGame.new(fakeinput)
            ttt.ask_for_player.should == "player2"
        end
    end
    
    context "#ask_for_move" do
        it "Should ask for a valid move" do
            fakeinput = FakeInput.new("1")
            fakegame = FakeGame.new
            ttt = TicTacToeGame::LaunchGame.new(fakeinput)

            ttt.ask_for_move(fakegame).should == 1
        end
    end


    context "#play game" do
        it "Should displays tie when game is over" do
            fakeinput = FakeInput.new("1")
            output = MockOutput.new
            game = FakeGame.new([])
            game.is_blocked = true
            ttt = TicTacToeGame::LaunchGame.new(fakeinput, output, game)
            
            ttt.play_game
            expect(output.tie).to be true
        end
        
        it "Should display win when the game is over" do
            fakeinput = FakeInput.new("1")
            output = MockOutput.new
            game = FakeGame.new([])
            game.is_blocked = false
            game.is_won = true
            ttt = TicTacToeGame::LaunchGame.new(fakeinput, output, game)

            ttt.play_game
            expect(output.win).to be true
        end

    end

    context "#other_player" do
        it "Should switch from player1 to player2" do
            turn = TicTacToeGame::LaunchGame.new

            turn.other_player.should == "player2"
        end
        it "Should switch from player2 to player1" do
            turn = TicTacToeGame::LaunchGame.new
            turn.other_player
            turn.other_player.should == "player1"
        end
    end
end