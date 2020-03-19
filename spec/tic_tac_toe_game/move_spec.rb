require_relative '../../lib/tic_tac_toe_game/move'
require_relative 'fake_toggle.rb'
require_relative './fake_game.rb'

RSpec.describe TicTacToeGame::Move do
    context "#move" do
        it "Should make a move with the current turn" do
            board=Array.new(9, "-")
            make_move=TicTacToeGame::Move.new(board)
            fake_toggle= FakeToggle.new
            make_move = make_move.move(0,fake_toggle)

            make_move.board.should == %w(x - -
                                         - - -
                                         - - -)       
        end

        it "should toggle the player after making a move" do
            board=Array.new(9, "-")
            make_move=TicTacToeGame::Move.new(board)
            fake_toggle= FakeToggle.new
            make_move = make_move.move(0,fake_toggle)
        
            fake_toggle.toggles.should == 1
        end

    end
    context "#unmove" do
        it "Should undo a move" do
            board=Array.new(9, "-")
            make_move=TicTacToeGame::Move.new(board)
            fake_toggle= FakeToggle.new
            make_move = make_move.move(0,fake_toggle).unmove(fake_toggle)

            make_move.board.should == board       
        end
    end
    
    context "#possible_moves" do
        it "Should list possible moves for initial position" do
            board=Array.new(9, "-")
            TicTacToeGame::Move.new(board).possible_moves.should == (0..8).to_a    
        end
        it "Should list possible moves for a position" do
            board=Array.new(9, "-")
            fake_toggle= FakeToggle.new
            TicTacToeGame::Move.new(board).move(2,fake_toggle).possible_moves.should == [0,1,3,4,5,6,7,8]   
        end
    end


end

