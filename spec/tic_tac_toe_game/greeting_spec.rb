require_relative '../../lib/tic_tac_toe_game/greeting.rb'

RSpec.describe TicTacToeGame::Greeting do
    it { expect(TicTacToeGame::Greeting.welcome).to eql 'Welcome to Tic Tac Toe Game' }
end