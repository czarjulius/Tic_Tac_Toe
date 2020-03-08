require_relative '../../lib/tic_tac_toe_game/move'
require_relative '../../lib/tic_tac_toe_game/toggle'
class FakeToggle
    attr_reader :toggles
    def initialize
        @toggles = 0
    end

    def current_turn
        'x'
    end
    
    def other_turn
        @toggles += 1
    end
end

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


end

