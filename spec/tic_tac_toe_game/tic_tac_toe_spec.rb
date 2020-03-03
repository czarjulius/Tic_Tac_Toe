require_relative '../../lib/tic_tac_toe_game/tic_tac_toe.rb'

RSpec.describe TicTacToeGame::TicTacToe do
    it { expect(TicTacToeGame::TicTacToe.welcome).to eql 'Welcome to Tic Tac Toe Game' }
end

describe TicTacToeGame::Position do
    context "#new" do
        it "Should initialize a new board" do
            position = TicTacToeGame::Position.new
            position.board.should == %w(- - -
                                        - - -
                                        - - -)
            position.turn.should == "x"
        end
    end
end
