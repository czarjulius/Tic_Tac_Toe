require 'game'
# require_relative '../..game'


RSpec.describe TicTacToeGame::Play do
    context "#possible_moves" do
        it "Should list possible moves for initial position" do
            board=Array.new(9, "-")
            play = TicTacToeGame::Play.new(board)
            expect(play.possible_moves).to eq((0..8).to_a)
        end
    end
end

