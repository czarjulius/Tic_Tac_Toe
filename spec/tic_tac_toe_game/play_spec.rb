require_relative '../../lib/tic_tac_toe_game/play'
require_relative '../../lib/tic_tac_toe_game/position'


RSpec.describe TicTacToeGame::Play do
    context "#possible_moves" do
        it "Should list possible moves for initial position" do
            board=Array.new(9, "-")
            play = TicTacToeGame::Play.new(board)
            play.possible_moves.should == (0..8).to_a
        end
    end
end

