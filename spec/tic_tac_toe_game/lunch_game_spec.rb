require_relative '../../lib/tic_tac_toe_game/lunch_game.rb'


RSpec.describe TicTacToeGame::TTT do
    context "#ask_for_player" do
        it "Should ask who will play first" do
            ttt = TicTacToeGame::TTT.new
            ttt.stub(:gets => "1\n")
            ttt.stub(:puts)
            ttt.stub(:print)
            ttt.ask_for_player.should == "player1"
        end
    end
    context "#ask_for_move" do
        it "Should ask for a valid move" do
            position = TicTacToeGame::Game.new
            ttt = TicTacToeGame::TTT.new
            ttt.stub(:gets => "1\n")
            ttt.stub(:puts)
            ttt.stub(:print)
            ttt.ask_for_move(position).should == 1
        end
    end
end