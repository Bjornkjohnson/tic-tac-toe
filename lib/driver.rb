require_relative 'game'
require_relative 'board'
require_relative 'board'
require_relative 'player'
require_relative 'EnglishView'
require_relative 'viewSelect'
require 'cli-colorize'

game = Game.new(Board.new, ViewSelect.view_select)
game.start_game