require_relative 'multiple_play_game'
require_relative './launch_game'
require_relative './output'
require_relative './continue_game'
require_relative './game'



TicTacToeGame::MultiplePlayGame.new(
    input=STDIN,
    output=Output.new,
    game = TicTacToeGame::Game.new, 
    lunch_game=TicTacToeGame::LaunchGame.new(input,output,game),
    continue_game = TicTacToeGame::ContinueGame.new(output, input)
).multiple_play_game

