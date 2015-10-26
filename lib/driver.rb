require_relative 'game'
require_relative 'board'
require_relative 'board'
require_relative 'player'
game = Game.new(Board.new, Computer.new, Human.new)
game.start_game