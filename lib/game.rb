require_relative 'view'
class Game
  attr_accessor :board
  def initialize(board, computer, human)
    
    @board = board
    @player2 = computer
    @player1 = human
  end

  def get_user_input(name)
      View.human_prompt(name)
      spot = gets.chomp
    
  end

  def turn(player, next_player)
      if player.class == Human
        #Not the best
        until player.get_human_spot(@board, next_player.marker, get_user_input(player.name))do
        end
        ####
        View.print_board(@board)
      else
        View.computer_thinking(player)
        player.eval_board(@board, next_player.marker)
        View.print_board(@board)
      end
  end

  def setup

  end

  def start_game
    View.welcome(@board)
    until @board.game_is_over || @board.tie
      turn(@player1, @player2)
      if !@board.game_is_over && !@board.tie
        turn(@player2, @player1)
      end
    end
    View.game_over
  end


end


