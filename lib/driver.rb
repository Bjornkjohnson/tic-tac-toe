require_relative 'game'
require_relative 'board'
require_relative 'board'
require_relative 'player'
require 'cli-colorize'

game = Game.new(Board.new)
game.start_game