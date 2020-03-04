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
        it "should initialize a position given a board and turn" do
            position = TicTacToeGame::Position.new(%w(- x -
                                                      - - -
                                                      - o -), "o")
            position.board.should == %w(- x -
                                        - - -
                                        - o -)
            position.turn.should == "o"
        end


    end
    context "#move" do
        it "Should make a move" do
            position = TicTacToeGame::Position.new.move(0)
            position.board.should == %w(x - -
                                        - - -
                                        - - -)
            position.turn.should == "o"
        end
    end

    context "#unmove" do
        it "Should undo a move" do
            position = TicTacToeGame::Position.new.move(1).unmove
            init = TicTacToeGame::Position.new
            position.board.should == init.board
            position.turn.should == init.turn
        end
    end
end


