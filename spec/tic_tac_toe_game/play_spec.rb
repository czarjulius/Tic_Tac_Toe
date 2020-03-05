require_relative '../../lib/tic_tac_toe_game/play'
require_relative '../../lib/tic_tac_toe_game/position'


RSpec.describe TicTacToeGame::Play do
    context "#possible_moves" do
        xit "Should list possible moves for initial position" do
            board=Array.new(9, "-")
            play = TicTacToeGame::Play.new(board)
            play.possible_moves.should == (0..8).to_a
        end
        
        xit "Should list possible moves for a position" do
            TicTacToeGame::Position.new.move(3)
            TicTacToeGame::Play.new.possible_moves.should == [0,1,2,4,5,6,7,8]
        end
    end
end

