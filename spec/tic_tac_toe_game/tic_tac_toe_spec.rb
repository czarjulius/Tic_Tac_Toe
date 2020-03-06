require_relative '../../lib/tic_tac_toe_game/position.rb'



RSpec.describe TicTacToeGame::Position do
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


    context "#win_lines" do
        it "Should find winning columns, rows, diagonals" do
            win_lines = TicTacToeGame::Position.new(%w(0 1 2
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
            TicTacToeGame::Position.new.win?("x").should == false
            TicTacToeGame::Position.new.win?("o").should == false
        end
        it "Should determine a win for x" do
            TicTacToeGame::Position.new(%w(x x x
                                            - - -
                                            - o o)).win?("x").should == true
        end
        it "Should determine a win for x" do
            TicTacToeGame::Position.new(%w(x x -
                                            - - -
                                            o o o)).win?("o").should == true
        end
    end

    context "#blocked?" do
        it "Should determine not blocked" do
            TicTacToeGame::Position.new.blocked?.should == false
        end
        it "Should determine blocked" do
            TicTacToeGame::Position.new(%w(x o x
                                           o x x
                                           o x o)).blocked?.should == true
        end
    end

    context "#evaluate_leaf" do
        it "Should determine nothing from initial position" do
            TicTacToeGame::Position.new.evaluate_leaf.should == nil
        end
        it "Should determine a won position for x" do
            TicTacToeGame::Position.new(%w(x - -
                                           o x -
                                           o - x)).evaluate_leaf.should == 100
        end
        it "Should determine a won position for o" do
            TicTacToeGame::Position.new(%w(o x -
                                           o x -
                                           o - x), "o").evaluate_leaf.should == -100
        end
        it "Should determine a blocked position" do
            TicTacToeGame::Position.new(%w(o x o
                                           o x -
                                           x o x), "x").evaluate_leaf.should == 0
        end
    end

    # context "#minimax" do
    #     it "Should determine an already won position" do
    #         TicTacToeGame::Position.new(%w(x x -
    #                                        x o o
    #                                        x o o)).minimax.should == 100
    #     end
    #     it "Should determine a  win in 1 for x" do
    #         TicTacToeGame::Position.new(%w(x x -
    #                                        - - -
    #                                        - o o), "x").minimax.should == 99
    #     end
    #     it "Should determines a  win in 1 for o" do
    #         TicTacToeGame::Position.new(%w(x x -
    #                                        - - -
    #                                        - o o), "o").minimax.should == -99
    #     end
    # end

    context "#end?" do
        it "Should see a position has not ended" do
            TicTacToeGame::Position.new.end?.should == false
        end

        it "Should see a position has ended with win for x" do
            TicTacToeGame::Position.new(%w(- - x
                                           - - x
                                           o o x)).end?.should == true
        end
        it "Should see a position has ended with win for o" do
            TicTacToeGame::Position.new(%w(- - x
                                           - - x
                                           o o o)).end?.should == true
        end
        it "Should see a position has ended due to no more moves" do
            TicTacToeGame::Position.new(%w(x o x
                                           x o x
                                           o x o)).end?.should == true
        end

    end

    context "#to_s" do
        it "Should represent a position" do
            TicTacToeGame::Position.new.move(3).move(4).to_s.should == <<-EOS
   |   |   
-----------
 x | o |   
-----------
   |   |   
      EOS
        end
    end
end

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
            position = TicTacToeGame::Position.new
            ttt = TicTacToeGame::TTT.new
            ttt.stub(:gets => "1\n")
            ttt.stub(:puts)
            ttt.stub(:print)
            ttt.ask_for_move(position).should == 1
        end
    end
end


