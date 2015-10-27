require_relative 'view'
class Game
  attr_accessor :board
  def initialize(board)
    
    @board = board
    # @player1 = human
    # @player2 = computer
    
  end

  # def get_user_input(name)
  #     View.human_prompt(name)
  #     spot = gets.chomp
    
  # end

  def turn(player, next_player)
      if player.class == Human
        #Not the best
        until player.get_human_spot(@board, next_player.marker, View.get_user_input(player.name))do
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
    choice = View.choose_players_types
    case choice 
    when 1
      human1 = Human.new
      human2 = Human.new
      View.player_setup(human1, human2)
      loop do
        first_player = View.first_player_select(human1,human2)
        if first_player == 1
          @player1 = human1
          @player2 = human2
          break
        end
        if first_player == 2
          @player1 = human2
          @player2 = human1
          break
        end
      end
    when 2
      computer1 = Computer.new
      computer2 = Computer.new
      View.player_setup(computer1, computer2)
      loop do
        first_player = View.first_player_select(computer1,computer2)
        if first_player == 1
          @player1 = computer1
          @player2 = computer2
          break
        end
        if first_player == 2
          @player1 = computer2
          @player2 = computer1
          break
        end
      end
    when 3
      human = Human.new
      computer = Computer.new
      View.player_setup(human, computer)
      loop do 
        first_player = View.first_player_select(human,computer)
        if first_player == 1
          @player1 = human
          @player2 = computer
          break
        end
        if first_player == 2
          @player1 = computer
          @player2 = human
          break
        end
      end
    else
      View.invalid_input
      setup
    end
  end

  def start_game
    View.welcome(@board)
    setup
    View.print_board(board)
    until @board.game_is_over || @board.tie
      turn(@player1, @player2)
      if !@board.game_is_over && !@board.tie
        turn(@player2, @player1)
      end
    end
    View.game_over
  end


end


