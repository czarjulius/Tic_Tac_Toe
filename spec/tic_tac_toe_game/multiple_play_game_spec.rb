require_relative '../../lib/tic_tac_toe_game/multiple_play_game.rb'
require_relative 'mock_lunch_game.rb'
require_relative 'mock_continue_game'

RSpec.describe TicTacToeGame::MultiplePlayGame do
    context "#multiple_play_game" do
        it "should invoke the 'play_game' when multiple play game method is called and the user response is true" do
            fakeinput = FakeInput.new(["1","4"])
            output = MockOutput.new
            game = FakeGame.new([])
            game.is_blocked = true
            fake_continue_game = FakeContinueGame.new
            fake_lunch_game = FakeLunchGame.new(fakeinput, output, game)
            multiple_game = TicTacToeGame::MultiplePlayGame.new(fakeinput, output, game,fake_lunch_game,fake_continue_game)
            multiple_game.multiple_play_game
            expect(fake_lunch_game.count_game).to eq  1
        end
        it "should invoke the 'play_game' when multiple play game method more than once" do
            fakeinput = FakeInput.new(["1","4"])
            output = MockOutput.new
            game = FakeGame.new([])
            game.is_blocked = true
            fake_continue_game = FakeContinueGame.new(5)
            fake_lunch_game = FakeLunchGame.new(fakeinput, output, game)
            multiple_game = TicTacToeGame::MultiplePlayGame.new(fakeinput, output, game,fake_lunch_game,fake_continue_game)
            multiple_game.multiple_play_game
            expect(fake_lunch_game.count_game).to eq  6
        end

    end


end

