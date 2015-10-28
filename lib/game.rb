require_relative 'view'

class Game
  attr_accessor :board
  def initialize(board)
    @board = board
  end

  def turn(player, next_player)
      if player.class == Human
        #Not the best
        until player.get_human_spot(@board, next_player.marker, View.get_user_input(player.name))do
        end
        ####
      else
        View.computer_thinking(player)
        player_choice = player.eval_board(@board, next_player.marker)
        View.player_choice(player, player_choice)
      end
      View.print_board(@board)
  end

  def first_player_select(player, other_player)
    loop do
      first_player = View.first_player_select(player,other_player)
      if first_player == 1
        @player1 = player
        @player2 = other_player
        break
      elsif first_player == 2
        @player1 = other_player
        @player2 = player
        break
      else
        View.invalid_input
      end
    end
  end

  def setup
    choice = View.choose_players_types
    # case choice 
    # when 1
    #   human1 = Human.new
    #   human2 = Human.new
    #   View.player_setup(human1, human2)
    #   first_player_select(human1,human2)
    # when 2
    #   computer1 = Computer.new
    #   computer2 = Computer.new
    #   View.player_setup(computer1, computer2)
    #   first_player_select(computer1, computer2)
    # when 3
    #   human = Human.new
    #   computer = Computer.new
    #   View.player_setup(human, computer)
    #   first_player_select(human, computer)
    # else
    #   View.invalid_input
    #   setup
    # end

    case choice
    when 1
      p1 = Human.new
      p2 = Human.new
    when 2
      p1 = Computer.new
      p2 = Computer.new
    when 3
      p1 = Human.new
      p2 = Computer.new
    else
      View.invalid_input
      setup
    end
      View.player_setup(p1, p2)
      first_player_select(p1, p2)
  end

  def determine_winner
    if board.winner == @player1.marker
      View.winner(@player1.name)
    else
      View.winner(@player2.name)
    end
  end

  def start_game
    View.welcome(@board)
    setup
    View.print_board(@board)
    until @board.game_is_over || @board.tie
      turn(@player1, @player2)
      if !@board.game_is_over && !@board.tie
        turn(@player2, @player1)
      end
    end
    View.tie if @board.tie
    determine_winner if @board.game_is_over
    View.game_over
  end


end


