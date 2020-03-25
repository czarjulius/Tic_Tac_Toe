require_relative '../../lib/console/launch_game'
require_relative 'fake_input'
require_relative 'fake_game.rb'
require_relative 'mock_output'
require_relative '../../lib/console/output.rb'
require_relative 'mock_continue_game'



RSpec.describe TicTacToeGame::LaunchGame do
    before(:each) do
        fakeinput = FakeInput.new(["0", "7", "1"])
        output = MockOutput.new
        fakegame = FakeGame.new
        @ttt_human = TicTacToeGame::LaunchGame.new(fakeinput,output,fakegame,opponent="human")
        @ttt_computer = TicTacToeGame::LaunchGame.new(fakeinput,output,fakegame,opponent="computer")

    end
    context "#ask_for_player" do
        it "Should accept player as player1" do
            expect(@ttt_human.ask_for_player).to eq("player1")
        end
        it "Should accept player as player2" do
            fakeinput = FakeInput.new(["0", "7", "2"])
            output = MockOutput.new
            fakegame = FakeGame.new
            ttt = TicTacToeGame::LaunchGame.new(fakeinput,output,fakegame,opponent="human")
            expect(ttt.ask_for_player).to eq("player2")

        end
        it "Should accept human as first player" do
            
            expect(@ttt_computer.ask_for_player).to eq("human")
        end
        it "Should accept computer as first player" do
            fakeinput = FakeInput.new(["0", "7", "2"])
            output = MockOutput.new
            fakegame = FakeGame.new
            ttt = TicTacToeGame::LaunchGame.new(fakeinput,output,fakegame,opponent="computer")
            expect(ttt.ask_for_player).to eq("computer")

        end
    end
    
    context "#ask_for_move" do
        it "Should ask for a valid move" do
            fakeinput = FakeInput.new("1")
            fakegame = FakeGame.new
            output = MockOutput.new
            fakegame = FakeGame.new
            ttt = TicTacToeGame::LaunchGame.new(fakeinput,output,fakegame,"human")

            expect(ttt.ask_for_move(fakegame)).to eq(1)

        end
    end


    context "#play game" do
        it "Should displays tie when game is over" do
            
            @ttt_human.play_game
        end
        
        it "Should display win when the game is over" do
            fakeinput = FakeInput.new(["1", "9"])
            output = MockOutput.new
            game = FakeGame.new([])
            game.is_blocked = false
            game.is_won = true
            ttt = TicTacToeGame::LaunchGame.new(fakeinput, output, game,opponent="human")

            ttt.play_game
            expect(output.win).to be true
        end

        it "Should display game while the game is not yet over" do
            fakeinput = FakeInput.new(["1", "9"])
            output = MockOutput.new
            game = FakeGame.new([])
            game.is_blocked = false
            game.is_won = true
            ttt = TicTacToeGame::LaunchGame.new(fakeinput, output, game, opponent="human")

            ttt.play_game
            expect(output.display_game(game)).to be true
        end

        it "Should turn end? to false after winning a game yet over" do
            fakeinput = FakeInput.new(["1", "1","1","5","4","8","7"])
            output = MockOutput.new
            game = TicTacToeGame::Game.new()
            ttt = TicTacToeGame::LaunchGame.new(fakeinput, output, game)

            ttt.play_game
            expect(game.end?).to be false
        end

        it "should reset board after play" do
            fakeinput = FakeInput.new(["1", "1","1","5","4","8","7"])
            output = MockOutput.new
            game = FakeGame.new([])
            ttt = TicTacToeGame::LaunchGame.new(fakeinput, output, game)

            ttt.play_game
            expect(game.empty_board).to be true
        end

        it "should reset game type after play" do
            fakeinput = FakeInput.new(["1", "1","1","5","4","8","7"])
            output = MockOutput.new
            game = FakeGame.new([])
            ttt = TicTacToeGame::LaunchGame.new(fakeinput, output, game)

            ttt.play_game
            expect(ttt.get_game_type).to be nil
        end

    end

    context "#other_player" do
        it "Should switch from player1 to player2" do
            fakeinput = FakeInput.new(["1", "9"])
            output = MockOutput.new
            game = FakeGame.new([])
            turn = TicTacToeGame::LaunchGame.new(fakeinput, output, game,opponent="human")

            expect(turn.other_player).to eq("player2")
        end
        it "Should switch from player2 to player1" do
            fakeinput = FakeInput.new(["1", "9"])
            output = MockOutput.new
            game = FakeGame.new([])
            turn = TicTacToeGame::LaunchGame.new(fakeinput, output, game,opponent="human")
            turn.other_player
            expect(turn.other_player).to eq("player1")
        end
        it "Should switch from human to computer" do
            fakeinput = FakeInput.new(["1", "9"])
            output = MockOutput.new
            game = FakeGame.new([])
            turn = TicTacToeGame::LaunchGame.new(fakeinput, output, game, "computer")

            expect(turn.other_player).to eq("human")
        end
        it "Should switch from computer to human" do
            fakeinput = FakeInput.new(["1", "9"])
            output = MockOutput.new
            game = FakeGame.new([])
            turn = TicTacToeGame::LaunchGame.new(fakeinput, output, game, "computer")
            turn.other_player
            expect(turn.other_player).to eq("computer")
        end
    end

    context "#ask_for_opponent" do
        it "Should accept human as opponent" do
            fakeinput = FakeInput.new(["3","4","1"])
            output = MockOutput.new
            fakegame = FakeGame.new
            ttt = TicTacToeGame::LaunchGame.new(fakeinput,output,fakegame)
            expect(ttt.ask_for_opponent).to eq("human")
        end
        it "Should accept computer as opponent" do
            fakeinput = FakeInput.new(["0", "7", "2"])
            output = MockOutput.new
            fakegame = FakeGame.new
            ttt = TicTacToeGame::LaunchGame.new(fakeinput,output,fakegame)
            expect(ttt.ask_for_opponent).to eq("computer")
        end
    end
end