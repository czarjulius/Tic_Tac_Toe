require_relative '../../lib/tic_tac_toe_game/game'

RSpec.describe TicTacToeGame::Game do
    context "#new" do
        it "Should initialize a new board" do
            position = TicTacToeGame::Game.new
            position.board.should == %w(- - -
                                        - - -
                                        - - -)
        end
        it "should initialize a position given a board and turn" do
            position = TicTacToeGame::Game.new(%w(- x -
                                                      - - -
                                                      - o -), "o")
            position.board.should == %w(- x -
                                        - - -
                                        - o -)
        end


    end
    
    context "#win_lines" do
        it "Should find winning columns, rows, diagonals" do
            win_lines = TicTacToeGame::Game.new(%w(0 1 2
                                                       3 4 5
                                                       6 7 8)).win_lines
            win_lines.should include(["0","1","2"])
            win_lines.should include(["3","4","5"])
            win_lines.should include(["6","7","8"])
            win_lines.should include(["0","3","6"])
            win_lines.should include(["1","4","7"])
            win_lines.should include(["0","4","8"])
            win_lines.should include(["2","4","6"])
        end
    end

    context "#win?" do
        it "Should determine no win" do
            TicTacToeGame::Game.new.win?("x").should == false
            TicTacToeGame::Game.new.win?("o").should == false
        end
        it "Should determine a win for x" do
            TicTacToeGame::Game.new(%w(x x x
                                       - - -
                                       - o o)).win?("x").should == true
        end
        it "Should determine a win for x" do
            TicTacToeGame::Game.new(%w(x x -
                                       - - -
                                       o o o)).win?("o").should == true
        end
    end

    context "#blocked?" do
        it "Should determine not blocked" do
            TicTacToeGame::Game.new.blocked?.should == false
        end
        it "Should determine blocked" do
            TicTacToeGame::Game.new(%w(x o x
                                       o x x
                                       o x o)).blocked?.should == true
        end
    end

    context "#evaluate_leaf" do
        it "Should determine nothing from initial position" do
            TicTacToeGame::Game.new.evaluate_leaf.should == nil
        end
        it "Should determine a won position for x" do
            TicTacToeGame::Game.new(%w(x - -
                                       o x -
                                       o - x)).evaluate_leaf.should == 100
        end
        it "Should determine a won position for o" do
            TicTacToeGame::Game.new(%w(o x -
                                       o x -
                                       o - x), "o").evaluate_leaf.should == -100
        end
        it "Should determine a blocked position" do
            TicTacToeGame::Game.new(%w(o x o
                                       o x -
                                       x o x), "x").evaluate_leaf.should == 0
        end
    end

    context "#end?" do
        it "Should see a position has not ended" do
            TicTacToeGame::Game.new.end?.should == false
        end

        it "Should see a position has ended with win for x" do
            TicTacToeGame::Game.new(%w(- - x
                                       - - x
                                       o o x)).end?.should == true
        end
        it "Should see a position has ended with win for o" do
            TicTacToeGame::Game.new(%w(- - x
                                       - - x
                                       o o o)).end?.should == true
        end
        it "Should see a position has ended due to no more moves" do
            TicTacToeGame::Game.new(%w(x o x
                                       x o x
                                       o x o)).end?.should == true
        end

    end

end
