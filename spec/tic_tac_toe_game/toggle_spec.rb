require_relative '../../lib/tic_tac_toe_game/toggle.rb'


RSpec.describe TicTacToeGame::Toggle do
    context "#other_turn" do
        it "Should switch from 'o' to 'x'" do
            turn = TicTacToeGame::Toggle.new("o")

            turn.other_turn.should == "x"
        end

        it "Should switch from 'x' to 'o'" do
            turn = TicTacToeGame::Toggle.new("x")

            turn.other_turn.should == "o"
        end
    end
end

