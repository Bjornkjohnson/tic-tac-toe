require_relative 'game'
require_relative 'board'
require_relative 'board'
require_relative 'player'
require_relative 'EnglishView'
require 'cli-colorize'

game = Game.new(Board.new, SpanishView.new)
game.start_game