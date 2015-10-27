require_relative 'game'
require_relative 'board'
require_relative 'board'
require_relative 'player'
require 'cli-colorize'
# game = Game.new(Board.new, Computer.new("Compy", "A".red), Computer.new("Zulu", "B".blue))
# game = Game.new(Board.new, Human.new("Compy", "A".red), Human.new("Zulu", "B".blue))

game = Game.new(Board.new)
game.start_game