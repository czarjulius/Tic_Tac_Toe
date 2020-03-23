require_relative '../../lib/tic_tac_toe_game/continue_game.rb'
require_relative 'mock_output'
require_relative 'fake_input'



RSpec.describe TicTacToeGame::ContinueGame do
    context "#continue_game" do
        it "Should prompt the user an option to continue playing" do
            output = MockOutput.new
            fakeinput = FakeInput.new("1")
            continue_game = TicTacToeGame::ContinueGame.new(output, fakeinput)
            continue_game.play_again?
            expect(output.display_play_again).to be true
        end
        it "Should return true when 1 is passed to play again" do
            output = MockOutput.new
            fakeinput = FakeInput.new("1")
            continue_game = TicTacToeGame::ContinueGame.new(output,fakeinput)
            expect(continue_game.play_again?).to be true

        end
        
    end
end

