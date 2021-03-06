require 'game'
require_relative 'fake_toggle.rb'
require_relative './fake_game.rb'

RSpec.describe TicTacToeGame::Move do
    context "#move" do
        it "Should make a move with the current turn" do
            board=Array.new(9, "-")
            make_move=TicTacToeGame::Move.new(board)
            fake_toggle= FakeToggle.new
            make_move = make_move.move(0,fake_toggle)

            expect(make_move.board).to eq( %w(x - -
                                         - - -
                                         - - -))       
        end

        it "should toggle the player after making a move" do
            board=Array.new(9, "-")
            make_move=TicTacToeGame::Move.new(board)
            fake_toggle= FakeToggle.new
            make_move = make_move.move(0,fake_toggle)
        
            expect(fake_toggle.toggles).to eq(1)
        end

    end
    context "#unmove" do
        it "Should undo a move" do
            board=Array.new(9, "-")
            make_move=TicTacToeGame::Move.new(board)
            fake_toggle= FakeToggle.new
            make_move = make_move.move(0,fake_toggle).unmove(fake_toggle)

            expect(make_move.board).to eq(board)    
        end
    end
    
    context "#possible_moves" do
        it "Should list possible moves for initial position" do
            board=Array.new(9, "-")
            move=TicTacToeGame::Move.new(board)
            expect(move.possible_moves).to eq((0..8).to_a)
        end
        it "Should list possible moves for a position" do
            board=Array.new(9, "-")
            fake_toggle= FakeToggle.new
            move=TicTacToeGame::Move.new(board)
            expect(move.move(2,fake_toggle).possible_moves).to eq([0,1,3,4,5,6,7,8])   
        end
    end


end

