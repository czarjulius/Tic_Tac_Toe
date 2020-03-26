require 'game'

RSpec.describe TicTacToeGame::Toggle do
    context "#other_turn" do
        it "Should switch from 'o' to 'x'" do
            turn = TicTacToeGame::Toggle.new("o")

            expect(turn.other_turn).to eq("x")
        end

        it "Should switch from 'x' to 'o'" do
            turn = TicTacToeGame::Toggle.new("x")

            expect(turn.other_turn).to eq("o")
        end
    end
end

